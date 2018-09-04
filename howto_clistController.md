# clistController

Ce contrôler, dérivé de cbaseController, est dédié à l'affichage d'une table.
La table a afficher doit être de type cmyTable. Chacune de ses colonnes doit être de type cmyColumn et chacun des contrôles appartenant à la colonne doit être d'un des types:
	cmyTextfield
	cmyCheckbox(lorsque l'on veut utiliser une checkbox)
	cmyCombo
	
Chaque colonne doit avoir un identifier unique.

# Chargement des données dans la table

Pour charger des données dans la table, vous devez surcharger la méthode chargements de cbaseController de la manière suivante:

	override func chargements (_ numrequete: Int) {
        	if maxChargements == 0 {
            		maxChargements = <nombre maximum de fois ou chargement doit-être appelé)
		}
		switch  numrequete {
			case 0:
				super.chargements(numrequete)
			case 1:
				super.chargements(numrequete)
			default:
				break
		}
        }

Cette méthode est automatiquement appelée avec le paramètre numrequete allant de 0 à maxChargements. C'est dans un des appels à chargement que vous alimenterez les données de la table.

Si ces données proviennent d'un service web, vous devrez utiliser Alamofire (voir https://github.com/patricerapaport/PRMacControls/tree/master/howto_webservice.md), vous utiliserez la méthode loadTable de la manière suivante:

	loadTable(table: <outlet table>, Cmd: <string à envoyer au webservice>, params: <dictionnaire a envoyer au webservice sous la forme [String: String]> )

Cette méthode loadTable sera invoquée dans une des occurrences de chargement.

# Saisie de données dans la table
Une table peut devenir éditable en positionnant la variable isEditable à ON sous Interface Builder. Cette action peut également être effectuée par programmation.

