//
//  enumerations.swift
//  ivrit
//
//  Created by Patrice Rapaport on 29/07/2018.
//  Copyright © 2018 Patrice Rapaport. All rights reserved.
//

import Foundation

public enum etatWindow {
    case nonedition
    case edition
    case ajout
}

@objc public enum cmyTypesBoutons: Int {
    case modifier       = 0
    case ajouter        = 1
    case supprimer      = 2
    case annuler        = 3
    case enregistrer    = 4
    case reglement      = 5
    case autre          = 6
    case imprimer       = 7
}

public enum mytypesBoutons {
    case modifier
    case ajouter
}

public extension Notification.Name {
    static let chargement           = Notification.Name("chargement")
}


