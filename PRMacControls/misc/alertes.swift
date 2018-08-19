//
//  File.swift
//  ivrit1
//
//  Created by Patrice Rapaport on 19/08/2018.
//  Copyright © 2018 Patrice Rapaport. All rights reserved.
//

import AppKit

open class messageBox {
    var alert: NSAlert!
    
    public init (_ aMsg: String) {
        alert = NSAlert()
        alert.informativeText = ""
        alert.messageText = aMsg
        alert.addButton(withTitle: "Non")
        alert.addButton(withTitle: "Oui")
    }
    
    public func runModal() -> Bool {
        if alert.runModal() == NSApplication.ModalResponse.alertSecondButtonReturn {
            return true
        } else {
            return false
        }
    }
}
