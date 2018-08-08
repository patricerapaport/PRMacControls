//
//  user.swift
//  ctrlsFramework
//
//  Created by Patrice Rapaport on 08/04/2018.
//  Copyright © 2018 Patrice Rapaport. All rights reserved.
//

import Foundation

public struct cUtilisateur {
    var donnees: [String: String]!
    var idsession: Int!
    
    init (response: [String:String]) {
        donnees = response
        if donnees.keys.contains("Session") {
            idsession = donnees["Session"]!.toInt()
        }
    }
}
