//
//  myListWindow.swift
//  testinput
//
//  Created by Patrice Rapaport on 24/09/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//

open class clistController: cbaseController{
    public override init () {
        super.init()
    }
    
    public override init(window: NSWindow!) {
        super.init(window: window)
    }

    required public init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    
    override open func windowWillLoad() {
        if (user == nil && mustBeLogged) {
            login()
        }
        super.windowWillLoad()
    }
    
    // Enregistrement dans la liste des fenêtres actives
    override open func register () {
        super.register()

    }
    
    override open func windowDidLoad() {
        super.windowDidLoad()
    }
    
    // Cette méthode doit être surchargée pour refermer les fenêtres connexes
    override open func fermetureAnnexes() {
    }
    
    override open func closeWindow() {
        super.closeWindow()
    }
    
    @objc override open func chargements (_ notification: NSNotification) {
        super.chargements(notification)
    }
    
    //détection de la NSTableView
    func myList (contenView: NSView) -> NSTableView? {
        var returnTable: NSTableView!
        for control in contenView.subviews {
            if control is NSScrollView {
                for control1 in control.subviews {
                    if control1 is NSClipView {
                        for table in control1.subviews {
                            if table is NSTableView {
                                returnTable = table as! NSTableView
                                break
                            }
                        }
                    }
                    if returnTable != nil {
                        break
                    }
                }
                if returnTable != nil {
                    break
                }
            }
            if returnTable != nil {
                break
            }
        }
        return returnTable
    }
    
    override open  func selected(_ tbl: cmyTable) {
        if window?.toolbar == nil {
            return
        }
        if !tbl.btsAttaches {
            let toolbar: NSToolbar? = (window?.toolbar)!
            if toolbar != nil && toolbar?.items.count != 0 {
                for i in 0...boutonsToolbar.count-1 {
                    if boutonsToolbar[i].typeBouton == .modifier {
                        if tbl.numberOfSelectedRows == 1 {
                            boutonsToolbar[i].action=#selector(self.Modifier(_:))
                        } else {
                            boutonsToolbar[i].action=nil
                        }
                    }
                    if boutonsToolbar[i].typeBouton == .supprimer {
                        if tbl.numberOfSelectedRows > 0 {
                            boutonsToolbar[i].action=#selector(self.Supprimer(_:))
                        } else {
                            boutonsToolbar[i].action=nil
                        }
                    }
                }
            }
        }
    }
    
    // a surcharger pour  créer une nouvelle rangée
    func nouvelleRangee(ctrl: cmyTable, donnees: [String:String]) -> [String:String] {
        return [:]
    }
    
    // rafraichir la table
    func refreshTable (id: Int, donnees: [String: String]) {
        let source = tableCourante?.datasource //.rows[(tableCourante?.ctrl as! myNewTable).rowselected]
        var index:Int = 0
        var trouve = false
        while (index < (source?.rows.count)!) {
            let item = source!.rows[index]
            let idLu: String = item.valeur(identifier: "id", interpreted: false) as! String
            if idLu.toInt() == id {
                item.maj(donnees: donnees)
                trouve = true
                break
            }
            index = index + 1
        }
        let tbl = tableCourante?.ctrl as! cmyTable
        if !trouve {
            tableCourante?.datasource.rows.append(csourceTable(parent: (tableCourante?.datasource!)!, response: donnees))
        }
        tbl.reloadData()
    }
}

// MARK: Notifications
extension clistController {
    
}

// MARK: opérations
extension clistController {
    @objc override open func Annuler(_ sender: Any) {
        super.Annuler(sender)
    }
    
    @objc override open func Ajouter(_ sender: Any) {
        setState(etat: .ajout)
    }
    
    @objc override open func Modifier(_ sender: Any) {
        viderToolbar()
        
        let table = tableCourante
        let ctrlTable = table?.ctrl
        var firstEditableColumn = 0
        var ixColumn = 0
        if ctrlTable is cmyTable {
            for colonne in (ctrlTable as! cmyTable).tableColumns {
                if colonne.isEditable {
                    let ctrl = (ctrlTable as! cmyTable).getCellControl(colonne.identifier.rawValue)
                    if ctrl != nil {
                        if ctrl is cmyTextfield {
                            if (ctrl as! cmyTextfield).isEditable {
                                firstEditableColumn = ixColumn
                                break;
                            }
                        } else {
                            #if DEBUG
                                Swift.print("\n\n----------- ATTENTION ----------")
                                Swift.print("myListWindow.Modifier  cas non prévu pour \(String(describing: ctrl?.className))")
                            #endif
                        }
                    }
                    
                }
                ixColumn = ixColumn + 1
            }
            (ctrlTable as! cmyTable).setState(etat: .edition)
        }
        if boutonsToolbar != nil {
            var index = 0
            for i in 0...boutonsToolbar.count-1 {
                let bt = boutonsToolbar[i]
                if bt.insertInToolbar(controller: self, etat: .edition, index: index) {
                    index = index + 1
                }
            }
        }
       
        (table?.ctrl as! NSTableView).editColumn(firstEditableColumn, row: (table?.ctrl as! cmyTable).rowselected, with: nil, select: true)
    }
    
    // A surcharger pour chaque grille
    @objc override open func enregistrer(completion: @escaping(Bool) -> Void) {
        super.enregistrer(completion: completion)
    }
    
    @objc override open func Save (_ sender: Any) -> Bool {
        if myPopover != nil && myPopover.isShown {
            myPopover.close()
        }
        if ctrls.verifControl() {
            donnees = [:]
            output()
            var newDict: [String: String] = [:]
            for (cle, valeur) in donnees {
                let els = valeur.components(separatedBy: "|")
                if els.count == 1 {
                    newDict[cle] = valeur
                } else {
                    for string in els {
                        let params = string.components(separatedBy: "=")
                        if params.count == 2 {
                            newDict[params[0]] = params[1]
                        }
                    }
                }
            }
            donnees = newDict
            setState(etat: .nonedition)
            return true
        } else {
            return false
        }
    }
}

extension clistController: webServiceProtocolDelegate {
    @objc func afterSend(response: [String], reason: String, control: cmyControl?) {
        let table = tableCourante
        if table?.ctrl is cmyTable {
            table?.datasource = crowsTable(table: table?.ctrl as! cmyTable, response: response)
            (table?.ctrl as! NSTableView).reloadData()
        }
    }
}
