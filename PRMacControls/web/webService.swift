//
//  webService.swift
//  ctrlsFramework
//
//  Created by Patrice Rapaport on 07/04/2018.
//  Copyright © 2018 Patrice Rapaport. All rights reserved.
//

import Foundation
import Alamofire

//Il faut ajouter au fichier info.plist:
//<key>NSAppTransportSecurity</key>
//<dict>
//<key>NSAllowsArbitraryLoads</key>
//<true/>
//<key>NSExceptionDomains</key>
//<dict>

protocol webServiceProtocolDelegate {
    func afterSend (response: [String], reason: String, control: cmyControl?)
}

open class cwebService {
    //var urlString = URL(string: "http://127.0.0.1/compta1/jsonsvces/server.php")
    var urlString = URL(string: "http://" + preferenceManager.wsAdresse +
    "/" + preferenceManager.wsRepertoire +
    "/" + preferenceManager.wsService)
    var params: [String: String]
    
    public init() {
        params = [:]
    }
    
    public init(cmd: String, _ aParams: [String: String]) {
        params = ["cmd": cmd]
        for (cle, valeur) in aParams {
            params[cle] = valeur
        }
        if user != nil && user.idsession > 0 {
            params["idsession"] = user.idsession.toString()
        }
    }
    
    public func send(completion: @escaping(Bool, [String]) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        let alert = NSAlert()
                        alert.informativeText = "Web Service"
                        alert.messageText = data.object(forKey: "msg") as! String
                        alert.runModal()
                        completion(false, [data.object(forKey: "msg") as! String])
                    } else {
                        completion(true, data.object(forKey: "reponse") as! [String])
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    
                }
        }
    }
    
    public func send(ctrl: cmyControl, completion: @escaping(Bool) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        ctrl.repositionneTabview()
                        ctrl.popover(data.object(forKey: "msg") as! String)
                        completion(false)
                    } else {
                        completion(true)
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    
                }
        }
    }
    
    public func sendForDict(completion: @escaping(Bool, NSDictionary?) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        let alert = NSAlert()
                        alert.informativeText = "Web Service"
                        alert.messageText = data.object(forKey: "msg") as! String
                        alert.runModal()
                        completion(false, nil)
                    } else {
                        completion(true, data)
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    
                }
        }
    }
    
    public func sendForDict(ctrl: cmyControl, completion: @escaping(Bool, NSDictionary?) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        ctrl.repositionneTabview()
                        ctrl.popover(data.object(forKey: "msg") as! String)
                        completion(false, nil)
                    } else {
                        completion(true, data)
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    
                }
        }
    }
    
    public func sendForOptions(completion: @escaping(Bool, [String]?) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        let alert = NSAlert()
                        alert.informativeText = "Web Service"
                        alert.messageText = data.object(forKey: "msg") as! String
                        alert.runModal()
                        completion(false, nil)
                    } else {
                        var lst = [String]()
                        for row in data.object(forKey: "rows") as! [NSDictionary] {
                            for (_, valeur) in row {
                                lst.append(valeur as! String)
                            }
                        }
                        completion(true, lst)
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    
                }
        }
    }
    
    public func sendForOptions(nomcle: String, completion: @escaping(Bool, [String]?) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        let alert = NSAlert()
                        alert.informativeText = "Web Service"
                        alert.messageText = data.object(forKey: "msg") as! String
                        alert.runModal()
                        completion(false, nil)
                    } else {
                        var lst = [String]()
                        for row in data.object(forKey: "rows") as! [NSDictionary] {
                            var valeur1: String!
                            var valeur2: String!
                            for (cle, valeur) in row {
                                if cle as! String == nomcle {
                                    valeur1 = valeur as! String
                                } else {
                                    valeur2 = valeur as! String
                                }
                                if (valeur1 != nil && valeur2 != nil) {
                                    lst.append(valeur1)
                                    lst.append(valeur2)
                                    valeur1 = nil
                                    valeur2 = nil
                                }
                            }
                        }
                        
                        completion(true, lst)
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    
                }
        }
    }
    
    public func sendForOptionsSortedByKey(completion: @escaping(Bool, [String]?) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        let alert = NSAlert()
                        alert.informativeText = "Web Service"
                        alert.messageText = data.object(forKey: "msg") as! String
                        alert.runModal()
                        completion(false, nil)
                    } else {
                        var keys = [String]()
                        var i = 0
                        for row in data.object(forKey: "rows") as! [NSDictionary] {
                            for (_, valeur) in row {
                                if i % 2 == 0 {
                                    keys.append(valeur as! String)
                                }
                                i += 1
                            }
                        }
                        keys.sort()
                        let lst = [String]()
                        completion(true, lst)
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    
                }
        }
    }
    
    public func send(table: cmyTable, completion: @escaping(Bool) -> Void) {
        Alamofire.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success (let JSON):
                    let data = JSON as! NSDictionary
                    if data.object(forKey: "result") as! String == "KO" {
                        let alert = NSAlert()
                        alert.informativeText = "Web Service"
                        alert.messageText = data.object(forKey: "msg") as! String
                        alert.runModal()
                        completion(false)
                    } else {
                        let exSelected = table.selectedRow
                        table.parent.datasource = crowsTable(table: table, dict: data)
                        table.reloadData()
                        if exSelected != -1 {
                            table.selectRow(exSelected)
                        }
                        completion(true)
                    }
                    
                case .failure(let error):
                    Swift.print(error)
                    let alert = NSAlert()
                    alert.informativeText = "Web Service"
                    alert.messageText = "Une erreur s'est produite"
                    alert.runModal()
                    completion(false)
                }
        }
    }
    
}
