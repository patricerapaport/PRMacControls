//
//
//  myWindow.swift
//  testinput
//
//  Created by Patrice Rapaport on 19/09/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//

open class cmyWindow: NSWindow {
    public var controller: cbaseController!
    
    func getCtrls (_ ctrl: cmyControl) -> clisteControles? {
        if ctrl.controller is cbaseController {
            return (ctrl.controller as! cbaseController).ctrls
        }
        else
        if ctrl.controller is cbaseView {
            return (ctrl.controller as! cbaseView).ctrls
        }
        return nil
    }
    
    open func afterVerif(currentFocus: cmyControl, event: NSEvent) -> cmyControl? {
        var focus: cmyControl? = currentFocus
        // a ce stade si currentFocus a la méthode nextfocus on doit l'appeler car cette méthode peut modifier la valeur de onSubmit du currentFocus
        if focus != nil && focus?.nextFocusControl != nil && !event.modifierFlags.contains(.shift) {
            _ = focus?.controller.perform(focus?.nextFocusControl, with: focus?.ctrl)
        }
        if focus != nil && (focus?.onSubmit)! && !event.modifierFlags.contains(.shift) {
            if focus?.submitMethod != nil {
                controller.perform(focus?.submitMethod, with: self)
                return nil
            } else if (focus?.hasSelector(.save))! {
                focus?.performAction(.save)
                return nil
            } else if focus?.tableView != nil && (focus?.tableView as! cmyTable).hasSelector(.save) {
                (focus?.tableView as! cmyTable).performAction(.save)
                return nil
            } else if focus?.outlineView != nil && (focus?.outlineView as! cOutline).hasSelector(.save) {
                (focus?.outlineView as! cOutline).performAction(.save)
                return nil
            }
            
            // Après un save, le currentFocus peut changer
            focus = controller.currentFocus
        }
        let next: cmyControl?
        if (event.modifierFlags.contains( .shift)) {
            if focus?.tableView != nil {
                let table = focus?.tableView
                if table is cmyTable {
                    let row = (table as! cmyTable).rowselected
                    let controles = (table as! cmyTable).sourceRow(row).ctrls
                    next = controles?.previousFocus(focus!)
                } else {
                    next = nil
                }
            } else {
                next = getCtrls(focus!)?.previousFocus(focus!)
            }
            
        } else {
            if focus?.tableView != nil {
                let table = focus?.tableView
                if table is cmyTable {
                    let row = (table as! cmyTable).rowselected
                    let controles = (table as! cmyTable).sourceRow(row).ctrls
                    next = controles?.nextFocus(focus!)
                } else {
                    next = nil
                }
            } else {
                next = getCtrls(focus!)?.nextFocus(focus!)
            }
        }
        if next != nil {
            makeFirstResponder(next?.ctrl)
            //next?.ctrl.becomeFirstResponder()
        }
        return focus
    }
    
    override open func sendEvent(_ event: NSEvent) {
        switch (event.type) {
        case .mouseExited, .mouseMoved, .leftMouseDragged,  .leftMouseUp, .scrollWheel,  .cursorUpdate: break
        case .leftMouseDown:
            break
        case .mouseEntered:
            break
        case .keyDown:
            let currentFocus = controller.currentFocus
            if currentFocus != nil {
                if currentFocus?.ctrl is cmyTextfield {
                    if [ckeyboardKeys.enter, ckeyboardKeys.enterNum, ckeyboardKeys.tab].contains(event.keyCode) {
                        return
                    }
                }
            }
        case .keyUp :
            var currentFocus = controller.currentFocus
            if event.keyCode == 65 { // On remplace la virgule par un point
                let newEvent = NSEvent.keyEvent(with: event.type, location: event.locationInWindow, modifierFlags: event.modifierFlags, timestamp: event.timestamp, windowNumber: event.windowNumber, context: nil, characters: ".", charactersIgnoringModifiers: event.charactersIgnoringModifiers!, isARepeat: event.isARepeat, keyCode: 43)
                super.sendEvent(newEvent!)
                return
            }
            if currentFocus?.ctrl is cmyTextfield {
                if [ckeyboardKeys.enter, ckeyboardKeys.enterNum, ckeyboardKeys.tab].contains(event.keyCode) {
                    (currentFocus?.ctrl as! cmyTextfield).keyUp(with: event)
                    let newEvent = NSEvent.keyEvent(with: event.type, location: event.locationInWindow, modifierFlags: event.modifierFlags, timestamp: event.timestamp, windowNumber: event.windowNumber, context: nil, characters: "", charactersIgnoringModifiers: event.charactersIgnoringModifiers!, isARepeat: event.isARepeat, keyCode: 0)
                    super.sendEvent(newEvent!)
                    return
                }
            }
            
            if (event.modifierFlags.contains(.command) || event.modifierFlags.contains(.control) ) && controller.state == .nonedition {
                controller.closeWindow()
                controller.close()
                return
            }
            if currentFocus?.ctrl is cmyTextFieldDecimal {
                if event.keyCode == 65 { // On remplace la virgule par un point
                    let newEvent = NSEvent.keyEvent(with: event.type, location: event.locationInWindow, modifierFlags: event.modifierFlags, timestamp: event.timestamp, windowNumber: event.windowNumber, context: nil, characters: ".", charactersIgnoringModifiers: event.charactersIgnoringModifiers!, isARepeat: event.isARepeat, keyCode: 43)
                    super.sendEvent(newEvent!)
                    return
                }
            }
            if event.keyCode ==  ckeyboardKeys.escape {
                if event.type == .keyDown {
                    return
                }
                if currentFocus != nil && currentFocus?.tableView != nil && (currentFocus?.tableView as! cmyTable).hasSelector(.annulation) {
                    (currentFocus?.tableView as! cmyTable).performAction(.annulation)
                }
                else
                if windowController is cbaseController {
                    (windowController as! cbaseController).Annuler(self)
                    return
                }
            }
            else
                if (event.keyCode == ckeyboardKeys.enter || event.keyCode == ckeyboardKeys.enterNum || event.keyCode == ckeyboardKeys.tab) {
                    if event.modifierFlags.contains( .control) {
                        currentFocus?.controlEnterRecu()
                        return
                    }
                    if event.type == .keyDown {
                        return
                    }
                    if currentFocus == nil {
                        super.sendEvent(event)
                        return  
                    }
                    if !event.modifierFlags.contains( .shift) {
                        currentFocus?.verifControl(completion: {
                            res  in
                            if res {
                                if self.controller.myPopover != nil &&  self.controller.myPopover.isShown {
                                    self.controller.myPopover.close()
                                }
                                
                                currentFocus = self.afterVerif(currentFocus: currentFocus!, event: event)
                            }
                            })
                    } else {
                        if controller.myPopover != nil &&  controller.myPopover.isShown {
                            controller.myPopover.close()
                        }
                        currentFocus = afterVerif(currentFocus: currentFocus!, event: event)
                    }
                    return
                }
                else {
                    //if currentFocus == nil || (event.type == .keyUp  && !(currentFocus?.acceptKey(event: event))!) {
                    if currentFocus == nil || !(currentFocus?.acceptKey(event: event))! {
                        return
                    }
                    #if DEBUG
                        //Swift.print("\n\n")
                        //if event.modifierFlags.contains(.shift) {
                        //    Swift.print("Shift actif\n")
                        //}
                        //Swift.print("\(event.description)")
                    #endif
            }
        default:
            #if DEBUG
                //Swift.print("\n\n")
                //Swift.print("\(event.description)")
            #endif
        }
        super.sendEvent(event)
    }
    
}
