# clistController

Ce contrôler, dérivé de cbaseController, est dédié à l'affichage d'une table.
La table a afficher doit être de type cmyTable. Chacune de ses colonnes doit être de type cmyColumn et chacun des contrôles appartenant à la colonne doit être d'un des types:
	cmyTextfield
	cmyCheckbox(lorsque l'on veut utiliser une checkbox)
	cmyCombo
	
Chaque colonne doit avoir un identifier unique.

# Chargement des données dans la table