//
//  myEditWindow.swift
//  testinput
//
//  Created by Patrice Rapaport on 18/09/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//


open class ceditWindow: cbaseController {
    public override init () {
        super.init()
    }
    
    public override init(window: NSWindow!) {
        super.init(window: window)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    
    override open func closeWindow() {
        super.closeWindow()
    }
    
    @objc override open func chargements(_ notification: NSNotification) {
        super.chargements(notification)
    }
    
    //surcharger la méthode quand on veut appliquer des modifications dans les données reçcues
    func transformDonnees () {
    }
    
    // surcharger la méthode quand on veut effectuer un traitement après la méthode input
    func afterInput() {
    }
    
    // Cette fonction doit être surchargée pour définir les actions à entreprendre quand une rangée est sélectionnée
    override open func selected (_ tbl: cmyTable) {
        super.selected(tbl)
    }
    
    @objc override open func Annuler(_ sender: Any) {
        super.Annuler(sender)
    }
    
    @objc override open func Ajouter(_ sender: Any) {
        super.Ajouter(sender)
    }
    
    // A surcharger pour chaque grille
    @objc override open func enregistrer(completion: @escaping(Bool) -> Void) {
        super.enregistrer(completion: completion)
    }
}

extension ceditWindow: webServiceProtocolDelegate {
    @objc func afterSend(response: [String], reason: String, control: cmyControl?) {
    }
}
