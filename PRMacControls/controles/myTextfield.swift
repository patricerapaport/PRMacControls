//
//  cmyTextfield.swift
//  testinput
//
//  Created by Patrice Rapaport on 19/10/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//

@IBDesignable open class cmyTextfield: NSTextField, NSTextFieldDelegate {
    public var parent: cmyControl!
    var internalOperation: Bool = false
    @IBInspectable public var obligatoire: Bool = false
    @IBInspectable public var isFiltre: Bool = false
    @IBInspectable public var onsubmit: Bool = false
    @IBInspectable public var isLabel: Bool = false
    @IBInspectable public var majuscules: Bool = false
    @IBInspectable public var submitMethod: String = ""
    
    override open var acceptsFirstResponder: Bool {
        get {
            return true
        }
    }
    
    var controller: NSResponder {
        get {
            return parent.controller
        }
    }
    
    @objc func delayFocus(info: Any?) {
        let ctrl = info as! NSControl
        internalOperation = true
        _ = ctrl.becomeFirstResponder()
        internalOperation = false
    }
    
    override open func becomeFirstResponder() -> Bool {
        // au chargement de cbaseController, le parent est nul
        if parent == nil {
            return true
        }
        
        if parent != nil && parent.tableView != nil && parent.tableView is cmyTable {
            if (parent.tableView as! cmyTable).state == .nonedition {
                return false
            }
        }
    
        var currentFocus: cmyControl!
        if controller is cbaseController {
            currentFocus = (controller as! cbaseController).currentFocus
        } else if controller is cbaseView {
            currentFocus = (controller as! cbaseView).currentFocus
        }
        if currentFocus != nil {
            if currentFocus?.identifier == identifier?.rawValue {
                internalOperation = true
                _ = super.becomeFirstResponder()
                internalOperation = false
                return false
            }
        }
        
        var bRes = true // valeur provisoire de retour
        if currentFocus != nil && currentFocus?.identifier != identifier?.rawValue {
            let currentFocusControles = currentFocus?.parent.controles
            let controles = parent.parent.controles
            if (currentFocusControles! as NSArray).index(of: currentFocus!) < (controles as NSArray).index(of:self.parent) {
                currentFocus?.verifControl(completion: {
                    res  in
                    if res {
                        var myPopover: NSPopover!
                        if self.controller is cbaseController {
                            myPopover = (self.controller as! cbaseController).myPopover
                        } else if self.controller is cbaseView {
                            myPopover = (self.controller as! cbaseView).myPopover
                        }
                        if myPopover != nil &&  myPopover.isShown {
                            myPopover.close()
                        }
                        bRes = true
                    } else {
                        bRes = false
                        let info = currentFocus.ctrl
                        self.perform(#selector(self.delayFocus), with: info, afterDelay: 0.3)
                        
                        
                        bRes = false
                    }
                })
            }
        }
        if bRes == false {
            return bRes
        } else {
            internalOperation = true
            bRes = super.becomeFirstResponder()
            internalOperation = false
        }
        
        parent.valeurAvant = stringValue
        if bRes {
            if parent != nil {
                    if controller is cbaseController {
                    let theController = controller as! cbaseController
                    theController.currentFocus = parent
                    if parent.getfocusMethod != nil {
                        theController.perform(parent.getfocusMethod, with: self as NSControl)
                    }
                }
                else if controller is cbaseView {
                    let theController = controller as! cbaseView
                    theController.currentFocus = parent
                    if parent.getfocusMethod != nil {
                        theController.perform(parent.getfocusMethod, with: self as NSControl)
                    }
                }
            }
        }
        return bRes
    }
    
    override open func resignFirstResponder() -> Bool {
        // au chargement de cbaseController, le parent est nul
        if parent == nil || internalOperation {
            return true
        }
        if parent.resignMethod != nil {
            if controller is cbaseController {
                let theController = controller as! cbaseController
                theController.perform(parent.resignMethod, with: self as NSControl)
            } else if controller is cbaseView {
                let theController = controller as! cbaseView
                theController.perform(parent.resignMethod, with: self as NSControl)
            }
        }
        return super.resignFirstResponder()
    }
    
    func closePopover() {
        if controller is cbaseController {
            let myController = controller as! cbaseController
            if myController.myPopover != nil && myController.myPopover.isShown {
                myController.myPopover.close()
            }
        } else if controller is cbaseView {
            let myController = controller as! cbaseView
            if myController.myPopover != nil && myController.myPopover.isShown {
                myController.myPopover.close()
            }
        }
    }
    
    //procédure appelée quand on reçoit keyup
    func acceptKey (event: NSEvent) -> Bool {
        return true
    }
    
    func controlEnterRecu() {
        var valeur = stringValue
        let editor = currentEditor()
        if (editor == nil) {
            return
        }
        let range: NSRange = (editor?.selectedRange)!
        if range.location >= valeur.count {
            stringValue = valeur+"\n"
            return
        } else {
            valeur.insert("\n", at: valeur.index(valeur.startIndex, offsetBy: range.location))
        }
    }
    
    func verifObligatoire() ->Bool {
        if majuscules {
            stringValue = stringValue.uppercased()
        }
        if obligatoire {
            if stringValue == "" {
                return false
            }
        }
        return true
    }
    
    func verifCoherence()->Bool {
        return true
    }
    
    override open func keyUp(with event: NSEvent) {
        if [ckeyboardKeys.enter, ckeyboardKeys.enterNum, ckeyboardKeys.tab].contains( event.keyCode) {
            parent.enterReceived (event)
        }
        else if event.keyCode ==  ckeyboardKeys.escape {
            parent.escapeReceived(event)
        } else if !parent.acceptKey(event: event) {
            return
        }
    }
}

