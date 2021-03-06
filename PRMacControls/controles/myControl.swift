//
//  cmyControl.swift
//  testinput
//
//  Created by Patrice Rapaport on 15/09/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//

class myNewOption {
    var cle: String
    var valeur: String
    
    init (key: String, value: String) {
        cle=key
        valeur=value
    }
    
    func equal (key: String)->Bool {
        return key == cle
    }
    
    func equal (value: String) ->Bool {
        return valeur == value
    }
    
    func equalsPartiel (partialValue: String) -> String? {
//let index = valeur.index(valeur.startIndex, offsetBy: partialValue.count)
        if partialValue.lowercased() == valeur.substr(from: 0, to:partialValue.count-1).lowercased() {
            return valeur
        }
        return nil
    }
}

open class cmyControl: NSObject {
    public var parent: clisteControles!
    public var datasource: crowsTable! // valable uniquement si ctrl est NSTableView
    public var valeurAvant: String!
    public var ctrl: NSView
    public var etat: etatWindow = .nonedition
    
    var tabviewItem: NSTabViewItem!
    var tableView: NSTableView!
    var outlineView: NSOutlineView!
    var boxView: NSBox!
    var source: [myNewOption]! // valable uniquement si ctrl est NSComboBox
    var verifControlMethod: Selector!
    var verifControlParams: Selector!
    var resignMethod: Selector!
    var nextFocusControl: Selector!
    var previousFocusControl: Selector!
    var getfocusMethod: Selector!
    var submitMethod: Selector!
    var acceptKeyMethod: Selector!
    var textColorMethod: Selector!
    var mySelectors: [cmySelector]!
    var verifSendfor: String! // Dans verifcontrol avec completion, il peut être nécessaire d'appeler webservice sous la forme send(ctrl:completion:) ou sous la forme sendForDict(ctrl:completion:). Dans le premier cas, verifSendFor a la valeur "result" (mise en place dans verifControl). Dans le second cas, la fonction appelée dans le controller doit positionner cette valeur à "dict"
    var verifSuiteMethode: String! // Dans verifControl avec completion, si vertifSendFor a la valeur dict, et que verifSuiteMethode est renseignée, la méthode correspondante du controller sera appelée avec en paramètres le NSDictionary btenu précédemment
    open var isSelectable: Bool {
        get {
            if ctrl is NSTextField {
                return (ctrl as! NSTextField).isSelectable
            } else {
                return false
            }
        }
        set (selectable) {
            if ctrl is NSTextField {
                (ctrl as! NSTextField).isSelectable = selectable
            }
        }
    }
    
    var isBezeled: Bool {
        get {
            if ctrl is NSTextField {
                return (ctrl as! NSTextField).isBezeled
            } else {
                return false
            }
        }
        set (bezeled) {
            if ctrl is NSTextField {
                (ctrl as! NSTextField).isBezeled = bezeled
            }
        }
    }
    
    var isEditable: Bool {
        get {
            if ctrl is NSTextField {
                return (ctrl as! NSTextField).isEditable
            } else {
                return false
            }
        }
        set (editable) {
            if ctrl is NSTextField {
                (ctrl as! NSTextField).isEditable = editable
            }
        }
    }
    
    var isEnabled: Bool {
        get {
            if ctrl is NSControl {
                return (ctrl as! NSControl).isEnabled
            } else {
                return true
            }
        }
        set (enabled) {
            if ctrl is NSControl {
                (ctrl as! NSControl).isEnabled = enabled
            }
        }
    }
    
    var isHidden: Bool {
        get {
            return ctrl.isHidden
        }
        set (hidden) {
            ctrl.isHidden = hidden
        }
    }
    
    var isFiltre: Bool {
        get {
            if ctrl is cmyTextfield {
                return (ctrl as! cmyTextfield).isFiltre
            }
            else
            if ctrl is cmyCombo {
                return (ctrl as! cmyCombo).isFiltre
            }
            else if ctrl is cmyCustomCheckbox {
                return (ctrl as! cmyCustomCheckbox).isFiltre
            }
            else {
                return false
            }
        }
    }
    
    var isLabel: Bool {
        get {
            if ctrl is cmyTextfield {
                return (ctrl as! cmyTextfield).isLabel
            } else if ctrl is cmyCombo {
                return (ctrl as! cmyCombo).isLabel
            } else {
                return false
            }
        }
        set (bLabel) {
            if ctrl is cmyTextfield {
                (ctrl as! cmyTextfield).isLabel = bLabel
            } else if ctrl is cmyCombo {
                (ctrl as! cmyCombo).isLabel = bLabel
            } 
        }
    }
    
    var onSubmit: Bool {
        get {
            if ctrl is cmyTextfield {
                return (ctrl as! cmyTextfield).onsubmit
            } else if ctrl is cmyCustomCheckbox {
                return (ctrl as! cmyCustomCheckbox).onsubmit
            } else {
                return false
            }
        }
        set (submit) {
            if  ctrl is cmyTextfield {
                (ctrl as! cmyTextfield).onsubmit = submit
            }
        }
    }
    
    public var identifier: String {
        get {
            return (ctrl.identifier?.rawValue)!
        }
        set (S) {
            ctrl.identifier = NSUserInterfaceItemIdentifier(rawValue: S)
        }
    }
    
    open var stringValue: String {
        get {
            if ctrl is cmyTextfield {
                return (ctrl as! cmyTextfield).stringValue
            }
            else
            if ctrl is cmyCombo {
                return (ctrl as! cmyCombo).stringValue
            }
            else if ctrl is cmyCustomCheckbox {
                return (ctrl as! cmyCustomCheckbox).stringValue
            }
            else {
                return ""
            }
        }
        set (S) {
            if ctrl is cmyTextfield {
                (ctrl as! cmyTextfield).stringValue = S
            }
            else
            if ctrl is cmyCombo {
                (ctrl as! cmyCombo).stringValue = S
            }
            else
            if ctrl is NSTextField { // pour les labels
                (ctrl as! NSTextField).stringValue = S
            }
        }
    }
    
    open var controller: NSResponder {
        get {
            return parent.myController
        }
    }
    
    var controllerState: etatWindow?{
        get {
            if controller is cbaseController {
                return (controller as! cbaseController).state
            }
            else
            if controller is cbaseView {
                return (controller as! cbaseView).state
            }
            else {
                return .nonedition
            }
        }
    }
    
    var window: NSResponder? {
        get {
            if controller is cbaseController {
                return (controller as! cbaseController).window!
            }
            else
            if controller is cbaseView {
                return (controller as! cbaseView).view
            }
            else {
                return nil
            }
        }
    }
    
    func _init () {
        if isLabel == false {
            if ctrl is NSTextField {
                isLabel = (ctrl as! NSTextField).isSelectable == false && (ctrl as! NSTextField).isEditable == false
            }
        }
        
        if tableView != nil {
            var frame = ctrl.frame
            if ctrl is cmyCombo {
                frame.origin.y = 2
            } else {
                frame.origin.y = 4
                frame.size.height = 24
            }
            ctrl.frame = frame
        }
        if (ctrl.superview?.superview is NSBox) {
            boxView = ctrl.superview?.superview as! NSBox
            if boxView is cmyBox {
                (boxView as! cmyBox).addControl(self)
            }
        }
        
        if ctrl is cmyTextfield {
            (ctrl as! cmyTextfield).parent = self
            if (ctrl as! cmyTextfield).submitMethod != "" {
                let nomMethod = (ctrl as! cmyTextfield).submitMethod + ":"
                let Method = Selector(nomMethod)
                if controller.responds (to: Method) {
                    submitMethod = Selector(nomMethod)
                }
            }
        } else if ctrl is cmyCombo {
            (ctrl as! cmyCombo).parent = self
        } else if ctrl is cmyCheckbox {
            (ctrl as! cmyCheckbox).parent = self
        }else if ctrl is cmyCustomCheckbox {
            (ctrl as! cmyCustomCheckbox).parent = self
        } else if ctrl is cmyButton {
            (ctrl as! cmyButton).parent = self
        } else if ctrl is NSTabView {
            for i in 0...(ctrl as! NSTabView).tabViewItems.count-1 {
                let item = (ctrl as! NSTabView).tabViewItems[i]
                if item is cmyTabviewItem {
                    (item as! cmyTabviewItem).parent = self
                }
            }
        } else if ctrl is cmyTable {
            (ctrl as! cmyTable).parent = self
            (ctrl as! cmyTable).setBoutonsAttaches()
        }
        
        var nomMethode: String = "load"
        var methode = Selector(nomMethode)
        if  ctrl.responds(to: methode) {
            ctrl.perform(methode)
        } else {
            nomMethode =  "load"+(ctrl.identifier?.rawValue.capitalized)!+"WithCtrl:"
            methode = Selector(nomMethode)
            if controller.responds (to: methode) {
                //controller.perform(methode)
                controller.perform(methode, with:self)
            }
        }
        
        nomMethode = "verif"+(ctrl.identifier?.rawValue.capitalized)!+"WithCtrl:"
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            verifControlMethod = methode
        }
        
        nomMethode = "verif"+(ctrl.identifier?.rawValue.capitalized)!
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            verifControlParams = methode
        }
        
        nomMethode = "acceptkey"+(ctrl.identifier?.rawValue.capitalized)!+"WithCtrl:event:"
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            acceptKeyMethod = methode
        }
        
        nomMethode = "nextfocus"+(ctrl.identifier?.rawValue.capitalized)!+"WithCtrl:"
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            nextFocusControl = methode
        }
        
        nomMethode = "previousfocus"+(ctrl.identifier?.rawValue.capitalized)!+"WithCtrl:"
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            previousFocusControl = methode
        }
        
        nomMethode = "getfocus"+identifier.capitalized+"WithCtrl:"
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            getfocusMethod = methode
        }
        
        nomMethode = "textcolor"+identifier.capitalized+"WithCtrl:"
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            textColorMethod = methode
        }
        
        nomMethode = "resign"+(ctrl.identifier?.rawValue.capitalized)!+"WithCtrl:"
        methode = Selector(nomMethode)
        if controller.responds (to: methode) {
            resignMethod = methode
        }
        
        if ctrl is cmyCustomCheckbox {
            nomMethode = "click"+identifier.capitalized+"WithCtrl:"
            methode = Selector(nomMethode)
            if controller.responds (to: methode) {
                (ctrl as! cmyCustomCheckbox).clickMethod = methode
            }
        }
    }
    
    init (_ aCtrl: NSView, aParent: clisteControles, aTabview: NSTabViewItem!) {
        ctrl = aCtrl
        parent = aParent
        super.init()
        tabviewItem = aTabview
        _init()
        
    }
    
    init (_ aCtrl: NSView, aParent: clisteControles, aTableview: NSTableView) {
        ctrl = aCtrl
        parent = aParent
        //isLabel = false
        super.init()
        tableView = aTableview
        _init()

    }
    
    func makeFirstResponder() {
        ctrl.window?.makeFirstResponder(ctrl)
    }
    
    func previousFocus() -> cmyControl? {
        var next: cmyControl!
        if tableView != nil {
            let table = tableView
            if table is cmyTable {
                let row = (table as! cmyTable).rowselected
                let controles = (table as! cmyTable).sourceRow(row).ctrls
                next = controles?.previousFocus(self)
            } else {
                next = nil
            }
        } else {
            next = parent.previousFocus(self)
        }
        return next
    }
    
    func nextFocus() -> cmyControl? {
        var next: cmyControl!
        if tableView != nil {
            let table = tableView
            if table is cmyTable {
                let row = (table as! cmyTable).rowselected
                let controles = (table as! cmyTable).sourceRow(row).ctrls
                next = controles?.nextFocus(self)
            } else {
                next = nil
            }
        } else {
            next = parent.nextFocus(self)
        }
        return next
    }
    
    public func setState (state: etatWindow) {
        if ctrl is cmyTable {
            //if state == .nonedition {
            //    (ctrl as! NSTableView).selectionHighlightStyle = .regular
            //} else {
            //    (ctrl as! NSTableView).selectionHighlightStyle = .none
            //}
            (ctrl as! cmyTable).setState(etat: state)
            etat = state
        }
        else
        if isLabel == false {
            etat = state
            if isFiltre {
                if state == .nonedition {
                    isSelectable = ctrl is cmyTable ? false : true
                    isBezeled = true
                    isEditable = ctrl is cmyTable ? false : true
                } else {
                    isSelectable = ctrl is cmyTable ? true : false
                    isBezeled = false
                    isEditable = ctrl is cmyTable ? true: false
                }
            } else {
                if state == .nonedition {
                    if tableView != nil && ctrl is cmyCombo && (ctrl as! cmyCombo).txtassocie != nil {
                        (ctrl as! cmyCombo).isHidden = true
                        (ctrl as! cmyCombo).txtassocie.isHidden = false
                    } else if tableView != nil && ctrl is cmyCustomCheckbox && (ctrl as! cmyCustomCheckbox).txtassocie != nil {
                        (ctrl as! cmyCustomCheckbox).isHidden = true
                        (ctrl as! cmyCustomCheckbox).txtassocie.isHidden = false
                    } else if ctrl is cmyButton {
                        (ctrl as! cmyButton).setState(state: state)
                    } else {
                        isSelectable = ctrl is cmyTable ? true : false
                        isBezeled = false
                        isEditable = ctrl is cmyTable ? true: false
                    }
                } else {
                    if tableView != nil && ctrl is cmyCombo && (ctrl as! cmyCombo).txtassocie != nil {
                        (ctrl as! cmyCombo).txtassocie.isHidden = true
                        (ctrl as! cmyCombo).isHidden = false
                        (ctrl as! cmyCombo).stringValue = (ctrl as! cmyCombo).txtassocie.stringValue
                    } else if tableView != nil && ctrl is cmyCustomCheckbox && (ctrl as! cmyCustomCheckbox).txtassocie != nil {
                        (ctrl as! cmyCustomCheckbox).txtassocie.isHidden = true
                        (ctrl as! cmyCustomCheckbox).isHidden = false
                        (ctrl as! cmyCustomCheckbox).stringValue = (ctrl as! cmyCustomCheckbox).txtassocie.stringValue
                    } else if ctrl is cmyButton {
                        (ctrl as! cmyButton).setState(state: state)
                    } else {
                        isSelectable = ctrl is cmyTable ? false : true
                        isBezeled = true
                        isEditable = ctrl is cmyTable ? false : true
                    }
                }
            }
        }
    }
    
    func input (_ aValue: String) {
        if ctrl is cmyCombo {
            (ctrl as! cmyCombo).input(aValue)
        }
        else if ctrl is cmyTextfield {
            (ctrl as! cmyTextfield).stringValue = aValue
        }
        else if ctrl is cmyCustomCheckbox {
            (ctrl as! cmyCustomCheckbox).stringValue = aValue
        }
        else if ctrl is cmyCheckbox {
            (ctrl as! cmyCheckbox).stringValue = aValue
        }
    }
    
    func input (donnees: [String: String]) {
        if ctrl is cmyTextfieldAdresse {
            (ctrl as! cmyTextfieldAdresse).input(donnees)
        }
    }
    
    func output(_ donnees: [String: String]) ->Any {
        if ctrl is cmyTable {
            return (ctrl as! cmyTable).output()
        }
        else
        if ctrl is cmyCombo {
            return (ctrl as! cmyCombo).getKey(selection: (ctrl as! cmyCombo).getIndex(valeur: (ctrl as! cmyCombo).stringValue))
        }
        else
        if ctrl is cmyTextfieldDate {
            return cDates((ctrl as! cmyTextfieldDate).stringValue).toSQL()
        }
        else
        if ctrl is cmyCustomCheckbox {
            return (ctrl as! cmyCustomCheckbox).stringValue
        }
        else
        if ctrl is cmyTextfieldAdresse {
            var res: [String: String] = [:]
            res["adresse"] = (ctrl as! cmyTextfieldAdresse).stringValue
            res["cpost"] = (ctrl as! cmyTextfieldAdresse).cpost
            res["ville"] = (ctrl as! cmyTextfieldAdresse).ville
            return res
        }
        else
        if ctrl is cmyCheckbox {
            return (ctrl as! cmyCheckbox).stringValue
        }
        else if ctrl is cmyTextfield {
            return (ctrl as! cmyTextfield).stringValue
        } else {
            return ""
        }
    }
    
    public func setDatasource (_ aSource: [String]) {
        if !(ctrl is NSComboBox) {
            Swift.print ("setDatasource ne peut -être utilisé que sur une NSCombobox (\(ctrl.description))")
        }
        var index = 0
        source = []
        while index < aSource.count {
            source = source + [myNewOption(key: aSource[index], value: aSource[index+1])]
            index += 2
        }
        
        (ctrl as! NSComboBox).usesDataSource = true
        (ctrl as! NSComboBox).dataSource = controller as? NSComboBoxDataSource
    }
    
    func enterReceived (_ event: NSEvent) {
        if !event.modifierFlags.contains( .shift) {
            var myPopover: NSPopover!
            if controller is cbaseController {
                myPopover = (controller as! cbaseController).myPopover
            } else if controller is cbaseView {
                myPopover = (controller as! cbaseView).myPopover
            }
            if myPopover != nil &&  myPopover.isShown {
                myPopover.close()
            }
            if onSubmit && !event.modifierFlags.contains(.shift) {
                if submitMethod != nil {
                    controller.perform(submitMethod, with: ctrl)
                    return
                } else if hasSelector(.save) {
                    performAction(.save)
                    return
                } else if tableView != nil && (tableView as! cmyTable).hasSelector(.save) {
                    (tableView as! cmyTable).performAction(.save)
                    return
                } else if outlineView != nil && (outlineView as! cOutline).hasSelector(.save) {
                    (outlineView as! cOutline).performAction(.save)
                    return
                }
                
                // Après un save, le currentFocus peut changer
                //focus = controller.currentFocus
            }
            if nextFocusControl != nil && !event.modifierFlags.contains(.shift) {
                _ = controller.perform(nextFocusControl, with: ctrl)
            } else {
                let next = nextFocus()
                if next != nil {
                    ctrl.window?.makeFirstResponder(next?.ctrl)
                } else {
                    // le controle est le dernier control de la grille, il faut le vérifier manuellement
                    if !verifControl() {
                        ctrl.becomeFirstResponder()
                    }
                }
            }
            
        } else {
            let prev = previousFocus()
            if prev != nil {
                ctrl.window?.makeFirstResponder(prev?.ctrl)
            }
        }
    }
    
    func escapeReceived (_ event: NSEvent) {
        if tableView != nil && tableView is cmyTable && (tableView as! cmyTable).hasSelector(.annulation) {
            (tableView as! cmyTable).performAction(.annulation)
        }
        else if controller is cbaseController {
            (controller as! cbaseController).Annuler(self)
        }
    }
    
    func controlEnterRecu() {
        if ctrl is cmyTextfield {
            (ctrl as! cmyTextfield).controlEnterRecu()
        }
    }
    
    public func popover (_ msg: String) {
        if controller is cbaseController {
            (controller as! cbaseController).showPopover(aControl: ctrl as! NSControl, msg: msg)
        }
        else if controller is cbaseView {
            (controller as! cbaseView).showPopover(aControl: ctrl as! NSControl, msg: msg)
        }
    }
    
    public func popover (aController: NSViewController) {
        if controller is cbaseController {
            (controller as! cbaseController).showPopover(aControl: ctrl as! NSControl, controller: aController)
        }
        else if controller is cbaseView {
            (controller as! cbaseView).showPopover(aControl: ctrl as! NSControl, controller: aController)
        }
    }
    
    func repositionneTabview() {
        if tabviewItem != nil && tabviewItem.tabView?.selectedTabViewItem != tabviewItem {
            tabviewItem.tabView?.selectTabViewItem(tabviewItem)
        }
    }
    
    open func acceptKey (event: NSEvent) -> Bool {
        if acceptKeyMethod != nil {
            let res = controller.perform(acceptKeyMethod, with: ctrl as! NSControl, with: event)
            if res == nil {
                return false
            }
            let bRes = Unmanaged<AnyObject>.fromOpaque(
                res!.toOpaque()).takeUnretainedValue()
            return (bRes as! NSNumber).intValue == 1 ? true : false
        } else if ctrl is cmyTextfield {
            return (ctrl as! cmyTextfield).acceptKey(event: event)
        } else if ctrl is cmyCombo {
            if [ckeyboardKeys.downArrow, ckeyboardKeys.upArrow].contains(event.keyCode) {
                return true
            }
            var S: String? = (ctrl as! cmyCombo).stringValue
            S = (ctrl as! cmyCombo).completedString(S!)
            if S != nil {
                (ctrl as! cmyCombo).stringValue = S!
            }
            return true
        } else {
            return true
        }
    }
}

extension cmyControl {
    public func verifControl() ->Bool {
        if tableView != nil && tableView is cmyTable && (tableView as! cmyTable).verifProc != nil {
            let nomMethode =  (tableView as! cmyTable).verifProc!+"WithCtrl:"
            let methode = Selector(nomMethode)
            if controller.responds (to: methode) {
                //controller.perform(methode)
                let res = controller.perform(methode, with: ctrl as! NSControl)
                if res == nil {
                    return false
                }
                let bRes = Unmanaged<AnyObject>.fromOpaque(
                    res!.toOpaque()).takeUnretainedValue()
                return (bRes as! NSNumber).intValue == 1 ? true : false
            }
        }
        if ctrl is cmyTextfield  {
            if !(ctrl as! cmyTextfield).verifObligatoire() {
                repositionneTabview()
                popover("Zone obligatoire")
                if window is NSWindow {
                    (window as! NSWindow).makeFirstResponder(ctrl)
                }
                //ctrl.becomeFirstResponder()
                return false
            }
            if (!(ctrl as! cmyTextfield).verifCoherence()) {
                return false
            }
        }
        else
            if ctrl is cmyCombo {
                if !(ctrl as! cmyCombo).verifObligatoire() {
                    repositionneTabview()
                    popover("Zone obligatoire")
                    if window is NSWindow {
                        (window as! NSWindow).makeFirstResponder(ctrl)
                    }
                    //ctrl.becomeFirstResponder()
                    return false
                }
        }
        if verifControlMethod != nil {
            let res = controller.perform(verifControlMethod, with: ctrl as! NSControl)
            if res == nil {
                return false
            }
            let bRes = Unmanaged<AnyObject>.fromOpaque(
                res!.toOpaque()).takeUnretainedValue()
            return (bRes as! NSNumber).intValue == 1 ? true : false
        } else {
            return true
        }
    }
    
    public func verifControl (completion: @escaping(Bool) -> Void) {
        if ctrl is cmyTextfield  {
            if !(ctrl as! cmyTextfield).verifObligatoire() {
                repositionneTabview()
                popover("Zone obligatoire")
                //if window is NSWindow {
                //    (window as! NSWindow).makeFirstResponder(ctrl)
                //}
                //ctrl.becomeFirstResponder()
                completion(false)
                return
            }
            if (!(ctrl as! cmyTextfield).verifCoherence()) {
                completion(false)
                return
            }
        }
        else if ctrl is cmyCombo {
            if !(ctrl as! cmyCombo).verifObligatoire() {
                repositionneTabview()
                popover("Zone obligatoire")
                if window is NSWindow {
                    (window as! NSWindow).makeFirstResponder(ctrl)
                }
                //ctrl.becomeFirstResponder()
                completion(false)
                return
            }
        }
        
        let theTable: NSTableView? = tableView
        if theTable != nil {
            if theTable is cmyTable && (theTable as! cmyTable).verifProc != nil {
                let nomMethode =  (tableView as! cmyTable).verifProc!+"WithCtrl:"
                let methode = Selector(nomMethode)
                if controller.responds (to: methode) {
                    //controller.perform(methode)
                    let res = controller.perform(methode, with: ctrl as! NSControl)
                    if res == nil {
                        completion(false)
                    }
                    let bRes = Unmanaged<AnyObject>.fromOpaque(
                        res!.toOpaque()).takeUnretainedValue()
                    completion((bRes as! NSNumber).intValue == 1 ? true : false)
                }
                return
            }
        }
        if controller is cbaseController && (controller as! cbaseController).verifproc != nil{
            let nomMethode =  (controller as! cbaseController).verifproc!+"WithCtrl:"
            let methode = Selector(nomMethode)
            if controller.responds (to: methode) {
                //controller.perform(methode)
                let res = controller.perform(methode, with: ctrl as! NSControl)
                if res == nil {
                    completion(false)
                } else {
                    let bRes = Unmanaged<AnyObject>.fromOpaque(
                        res!.toOpaque()).takeUnretainedValue()
                    completion((bRes as! NSNumber).intValue == 1 ? true : false)
                }
            } else {
                Swift.print("La méthode \(controller.className).\((controller as! cbaseController).verifproc!)withCtrl: n'est pas implémentée")
            }
            return
        }
        
        if verifControlMethod != nil {
            let res = controller.perform(verifControlMethod, with: ctrl as! NSControl)
            if res == nil {
                completion(false)
                return
            }
            let bRes = Unmanaged<AnyObject>.fromOpaque(
                res!.toOpaque()).takeUnretainedValue()
            completion((bRes as! NSNumber).intValue == 1 ? true : false)
        } else if verifControlParams != nil {
            verifSendfor = "result"
            verifSuiteMethode = nil
            let res = controller.perform(verifControlParams)
            let bParams: AnyObject? = Unmanaged<AnyObject>.fromOpaque(
                res!.toOpaque()).takeUnretainedValue()
            if bParams == nil {
                completion (false)
            }
            let params = bParams as! [String: String]
            if params.count == 0 {
                completion(true)
            } else {
                let ws = cwebService(cmd: "cmd", params)
                if verifSendfor == "result" {
                    ws.send(ctrl: self, completion: {
                        res -> Void in
                        if !res {
                            if self.window is NSWindow {
                                (self.window as! NSWindow).makeFirstResponder(self.ctrl)
                            }
                            //_ = self.ctrl.becomeFirstResponder()
                            completion(false)
                        } else {
                            completion(true)
                        }
                    })
                } else {
                    ws.sendForDict(ctrl: self, completion: {
                        res, dict ->Void in
                        if !res {
                            if self.window is NSWindow {
                                (self.window as! NSWindow).makeFirstResponder(self.ctrl)
                            }
                            //_ = self.ctrl.becomeFirstResponder()
                            completion(false)
                        } else {
                            if self.verifSuiteMethode == nil {
                                completion(true)
                            } else {
                                let nomMethode = self.verifSuiteMethode+"WithDict:"
                                let methode = Selector(nomMethode)
                                if self.controller.responds (to: methode) {
                                    let result = self.controller.perform(methode, with: dict?.object(forKey: "row"))
                                    if result == nil {
                                        completion(false)
                                    } else {
                                        let bRes = Unmanaged<AnyObject>.fromOpaque(
                                            result!.toOpaque()).takeUnretainedValue()
                                        completion((bRes as! NSNumber).intValue == 1 ? true : false)
                                    }
                                } else {
                                    completion(false)
                                }
                            }
                        }
                    })
                }
            }
        } else {
            completion(true)
        }
    }
}

//MARK: mySelectorProtocol
extension cmyControl: mySelectorProtocol {
    var selectors: [cmySelector]?  {
        get {
            if mySelectors == nil {
                mySelectors = []
            }
            return mySelectors
        }
        set (S) {
            mySelectors = S
        }
    }
    
}

open class cmyTextfieldDoc: cmyTextfield {
    var document: String!
    var directory: String!
    var trackingArea: NSTrackingArea?
    var suffixe: String = ""
    
    //override open var acceptsFirstResponder: Bool {return false}
    
    func input (_ donnees: [String: String]) {
        if donnees.keys.contains((self.identifier?.rawValue)!) {
            //let document: String = "document" + (!suffixe.isEmpty ? suffixe : "")
            //let directory: String = "repertoire" + (!suffixe.isEmpty ? suffixe : "")
            self.stringValue = donnees["document"]!
        }
    }
    
    override open func mouseEntered(with event: NSEvent) {
        Swift.print("\(String(describing: self.identifier)) Mouse entered")
    }
    
    override open func mouseExited(with event: NSEvent) {
        Swift.print("\(String(describing: self.identifier)) Mouse exited")
    }
    
    override open func mouseDown(with event: NSEvent) {
        Swift.print("\(String(describing: self.identifier)) Mouse down")
        let repertoire = "/users/patricerapaport/Sites/compta1/Documents/"+directory+"/"+document
        Swift.print("\(repertoire)")
        //var dir: UnsafeMutablePointer<ObjCBool>!
        let manager = FileManager.default
        _ = manager.isReadableFile(atPath: repertoire)
        let workSpace =  NSWorkspace.shared
        _ = workSpace.openFile(repertoire)
    }
}

@IBDesignable class myNewCheckControl: cmyTextfield {
    override init(frame: NSRect) {
        var myRect = frame
        myRect.size.width = 20
        myRect.size.height = 20
        super.init(frame: myRect)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    @IBInspectable override var frame: NSRect {
        get {
            var aFrame = super.frame
            aFrame.size.height = 20
            aFrame.size.height = 20
            return aFrame
        }
        set (aFrame) {
            var myFrame = aFrame
            myFrame.size.height = 20
            myFrame.size.height = 20
            super.frame = myFrame
            subviews[0].frame = myFrame
            needsDisplay = true
        }
    }
    
    override func layout() {
        super.layout()
        layer?.frame.size.width = 20
        updateLayer()
    }
    
}

