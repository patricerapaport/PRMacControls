# PRMacControls
offre une gestion des controles de saisie osx

Chaque NSWindowController doit être sous-classé soit en cListController si ce controller est destiné à gérer une liste contenue dans une NSTableView, soit en ceditController s'il s'agit d'un controller contenant des contrôles d'édition.

Les classes cListController et ceditController dérivent de la classe de base cbaseController qui elle même dérive de NSWindowController

Les contrôles de saisie sous-classés sont:
	NSTextField sous classé en cmyTextfield
	NSButton sous-classé en cmyCheckbox(lorsque l'on veut utiliser une checkbox)
	NSComboBox sous classé en cmyCheckBox
	NSTableView sous classé en cmyTable
