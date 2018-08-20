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

lorsque vous appelez setState(état: .nonedition) tous les contrôles de la grille sont en état désactivés (disabled) et ils refusent la prise de focus (à l'exception des contrôles dont la variable isFiltre est à ON).