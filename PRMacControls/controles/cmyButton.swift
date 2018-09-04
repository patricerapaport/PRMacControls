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
    @IBInspectable public var tipeName: String = "autre" {
        willSet {
            if let newType: cmyTypesBoutons = cmyTypesBoutons(named: newValue?.lowercased() ?? "") {
                value = newType.toString()
            } else {
                value = "autre"
            }
        }
        didSet {
            value = "autre"
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
    
    public func setState (state: etatWindow) {
        switch _type {
        case .annuler:
            isEnabled = state != .nonedition
        case .modifier:
            isEnabled = state == .nonedition
        case .enregistrer:
            isEnabled = state != .nonedition
        default: break
        }
    }
    
    override open func mouseDown(with event: NSEvent) {
        if action != nil {
            super.mouseDown(with: event)
        } else {
            var nomMethode: String!
            switch _type {
                case .annuler:
                    nomMethode = "Annuler:"
                case .modifier:
                    nomMethode = "Modifier:"
                case .enregistrer:
                    nomMethode = "Save:"
                default: break
            }
            if nomMethode != nil {
                let method = Selector(nomMethode)
                if controller.responds(to: method) {
                    controller.perform(method, with: self)
                }
            }
        }
    }
    
}
