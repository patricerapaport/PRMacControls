# PRMacControls
offre une gestion des controles de saisie osx

Chaque NSWindowController doit être sous-classé soit en cListController si ce controller est destiné à gérer une liste contenue dans une NSTableView, soit en ceditController s'il s'agit d'un controller contenant des contrôles d'édition.

Les classes cListController et ceditController dérivent de la classe de base cbaseController qui elle même dérive de NSWindowController

Les contrôles de saisie sous-classés sont:
	NSTextField sous classé en cmyTextfield
	NSButton sous-classé en cmyCheckbox(lorsque l'on veut utiliser une checkbox)
	NSComboBox sous classé en cmyCombo
	NSTableView sous classé en cmyTable

Pour initialiser un contrôler décrivant de clistController ou bien ceditController, il faut:

créer un nouveau NSWindowController dans Xcode, le déclarer en clistController ou ceditController, et lui assigner un constructeur:

    override init(window: NSWindow!) {
        super.init(window: window)
    }

Il est bien entendu possible d'avoir un constructeur supplémentaire sous la forme:

    override init() {
        <initialisations de variables personnalisées>
        super.init(window: nil)
    }

dans ce dernier cas, il faudra appeler le constructeur de la classe de base en utilisant le code: super.init(window: nil).

Dans tous les cas, il faudra rajouter le constructeur:

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

Lorsque le constructeur de la classe de base est appelé, il répertorie dans une liste (ctrls) tous les contrôles que vous avez déposé dans le fichier XIB, pour peu que vous les ayez sous-classés en cmyTextfield, cmyCheckbox, cmyCombo ou cmyTable.

[LA CLASSE ceditController.](https://github.com/patricerapaport/PRMacControls/tree/master/howto_ceditController.md)

[LA CLASSE clistController.](https://github.com/patricerapaport/PRMacControls/tree/master/howto_clistController.md)

