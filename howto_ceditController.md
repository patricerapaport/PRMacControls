# ceditController

Les différents contrôles de votre contrôleur ayant été sous classés il est maintenant temps de laisser l'utilisateur interagir avec eux.

Une grille d'édition peut avoir deux états: 
	un état édition ou l'utilisateur peut accéder les différents contrôles, et modifier leur contenu, 
	un état nonedition ou l'utilisateur ne peut que visualiser le contenu des contrôles sans pouvoir les éditer.

Pour passer d'un état à l'autre, il faut appeler la méthode setState de ceditController sous la forme: setState(état: etatWindow), etatWindow étant défini de la manière suivante:

		public enum etatWindow {
 		   case nonedition
    		   case edition
		   case ajout
		}

Lorsque vous appelez setState(état: .nonedition) tous les contrôles de la grille sont en état désactivés (disabled) et ils refusent la prise de focus (à l'exception des contrôles dont la variable isFiltre est à ON).

Lorsque vous appelez setState(état: .edition) tous les contrôles de la grille sont activés et le focus est placé sur le premier contrôle.

En état d'édition, lorsqu'un contrôle perd le focus pour passer au contrôle suivant, soit en actionnant la touche TABULATION, soit en actionnant la touche ENTREE, soit en cliquant avec la souris sur un autre contrôle, une procédure de vérification du contrôle est enclenchée.

Dans Interface Builder, le contrôle peut être défini comme étant obligatoire.
Dans ce cas sa valeur devra obligatoirement être renseignée.

Il est de votre responsabilité d'écrire la procédure de vérification.
Celle-ci peut être une méthode générale de ceditController, sous la forme:

	@objc func editControles(ctrl: NSControl) ->Bool {
	}

cette méthode prend pour paramètre le contrôle à vérifier et renvoie true si la vérification est OK, false dans le cas contraire.

Si la méthode editControles n'est pas implémentée dans votre classe contrôler, chaque contrôle peut invoquer sa propre procédure de vérification en implémentant dans la classe contrôler une procédure 

	@objc verif<identifier du contrôle>(ctrl: NSControl) ->Bool {
	}

l'identifier se renseigne dans le fichier XIB correspondant à votre classe.

Attention, quelle que soit la casse de l'identifier correspondant au contrôle à vérifier, dans le nom de la méthode il doit commencer par une majuscule et toutes les autres lettres doivent être en minuscule. EX: méthode pour vérifier le contrôle ayant pour identifier "tESt": 

	@objc verifTest (ctrl: NSControl) -> Bool {
	}

La méthode de  vérification peut faire appel à des vérifications distantes (Alamofire). Dans ce cas, elle prend une forme différente:

	@objc func verif<identifier du contrôle> () -> [String: String] {
	}

Cette méthode renvoie un dictionnaire qui sera utilisé par Alamlofire pour interroger un service web. (voir https://github.com/patricerapaport/PRMacControls/tree/master/howto_webservice.md)

# Chargement des données dans la grille
cbaseController, la classe parente de ceditController a une variable données (public var donnees: [String: String] = [:]). La méthode input() permet de charger les valeurs de chaque contrôle de la manière suivante: si l'identifier d'un contrôle d'édition correspond à une clé du dictionnaire données, alors la valeur associée à cette clé sera affichée dans ce contrôle.

Si vous désirez charger des données dans vos contrôles, vous devez écrire une procédure de chargement des données sous la forme:

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

Cette méthode est automatiquement appelée avec le paramètre numrequete allant de 0 à maxChargements.

Si les données proviennent d'un service web, vous devrez utiliser Alamofire (voir https://github.com/patricerapaport/PRMacControls/tree/master/howto_webservice.md). Dans ce cas, l'appel à la méthode parent chargements se fera dans le callback.

Une fois les chargements effectués, la méthode afterChargements est automatiquement appelée. La méthode de base est:

	open func afterChargements() {
        	setState(etat: .nonedition)
    	}
