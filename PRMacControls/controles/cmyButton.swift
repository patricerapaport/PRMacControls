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
    public var _type: cmyTypesBoutons!
    @IBInspectable public var tipeName: String? {
        willSet {
            if let newType: cmyTypesBoutons = cmyTypesBoutons(named: newValue?.lowercased() ?? "") {
                _type = newType
            }
        }
    }
    
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
