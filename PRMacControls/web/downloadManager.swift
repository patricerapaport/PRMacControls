//
//  downloadManager.swift
//  ctrlsFramework
//
//  Created by Patrice Rapaport on 07/04/2018.
//  Copyright © 2018 Patrice Rapaport. All rights reserved.
//

import Foundation
import Alamofire

open class cdownloadManager {
    func makeCorrectUrl (_ initString: String)-> String {
        var els = initString.components(separatedBy: "/")
        var finalString = ""
        for i in 0...els.count-1 {
            if i > 0 {
                finalString = finalString + "/"
            }
            finalString = finalString + els[i].addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed)!
        }
        return finalString
    }
    
    func showFileWithPath(path: String){
        let isFileFound:Bool? = FileManager.default.fileExists(atPath: path)
        if isFileFound == true{
            let workSpace =  NSWorkspace.shared
            workSpace.openFile(path)
        }
    }
    
    func startDownload(directory: String, docname: String) {
        let server = "http://" + preferenceManager.wsAdresse + "/documents/"
        let newpath = server + makeCorrectUrl(directory) + "/" + makeCorrectUrl(docname)
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
            documentsURL.appendPathComponent(docname)
            return (documentsURL, [.removePreviousFile])
        }
        
        Alamofire.download(URL(string: newpath)!, to: destination).responseData { response in
            if response.error == nil, let destinationUrl = response.destinationURL?.path {
                self.showFileWithPath(path: destinationUrl)
            }
        }

    }
    
    func upload (filename: String, parameters: [String: String], completion: @escaping([String: String]) -> Void) {
        let server = "http://" + preferenceManager.wsAdresse + "/" + preferenceManager.wsRepertoire + "/" + "/upload.php"
        Alamofire.upload(multipartFormData: { (data: MultipartFormData) in
            for (key, value) in parameters {
                data.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            data.append(URL(fileURLWithPath: filename) as URL, withName: "upload")
        }, to: server) {  (encodingResult) in            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    var resDict: [String:String] = [:]
                    switch response.result {
                    case .failure(let encodingError):
                        print(encodingError)
                        return
                    default: break
                    }
                    let dict = response.result.value as! NSDictionary
                    for key in dict.allKeys {
                        let cle = key as! String
                        resDict[cle] = (dict.value(forKey: cle) as! String)
                    }
                    completion(resDict)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
}
