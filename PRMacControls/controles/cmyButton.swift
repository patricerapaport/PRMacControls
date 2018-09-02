//
//  cmyButton.swift
//  PRMacControls
//
//  Created by Patrice Rapaport on 01/09/2018.
//  Copyright © 2018 Patrice Rapaport. All rights reserved.
//

import Cocoa

@IBDesignable open class cmyButton: NSButton {
    public var parent: cmyControl!
    public var _type: cmyTypesBoutons = .autre
    #if !TARGET_INTERFACE_BUILDER
    @IBInspectable public var tipeName: String? {
        //willSet {
        //    if let newType: cmyTypesBoutons = cmyTypesBoutons(named: newValue?.lowercased() ?? "") {
        //        _type = newType
        //    }
        //}
        
        get {
            switch _type {
            case .modifier : return "modifier"
            case .ajouter: return "ajouter"
            case .supprimer: return "supprimer"
            case .annuler: return "annuler"
            case .enregistrer: return "enregistrer"
            case .reglement: return "reglement"
            case .imprimer: return "imprimer"
            default: return "autre"
            }
        }
        set (tipe) {
            if let newType: cmyTypesBoutons = cmyTypesBoutons(named: tipe?.lowercased() ?? "") {
                _type = newType
            }
        }
    }
    #else
    @IBInspectable public var tipeName: String? {
        willSet {
            if let newType: cmyTypesBoutons = cmyTypesBoutons(named: newValue?.lowercased() ?? "") {
                self.tipeName = newType.toString()
            } else {
                self.tipeName = "autre"
            }
        }
        didSet {
            self.tipeName = "autre"
        }
    }
    #endif
    
    
    var controller: NSResponder {
        get {
            return parent.controller
        }
    }
    
    override open func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
