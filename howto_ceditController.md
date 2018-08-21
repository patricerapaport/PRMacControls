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

Lorsque vous appelez setState(état: .edition) tous ls contrôles de la grille sont activés et le focus est placé sur le premier contrôle.

En état d'édition, lorsqu'un contrôle perd le focus pour passer au contrôle suivant, soit en actionnant la touche TABULATION, soit en actionnant la touche ENTREE, soit en cliquant avec la souris sur un autre contrôle, une procédure de vérification du contrôle est enclenchée.

Il est de votre responsabilité d'écrire cette procédure de vérification.
Celle-ci peut être une méthode générale de ceditController, sous la forme:
	@objc func <nom de la méthode>(ctrl: NSControl) ->Bool {
	}
cette méthode prend pour paramètre le contrôle à vérifier et renvoie true si la vérification est OK, false dans le cas contraire.

