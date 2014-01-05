# Simulateur de netlist Sim #

Cette archive contient les sources du programme `sim`, un simulateur de netlist.


## Installation ##

### Prérequis ###
L'installation nécessite make, ocamlopt, ocamldep et menhir. Le plus simple est
d'utiliser Linux.

#### Sous Linux ####
make est sûrement déjà installé, ocamlopt et ocamldep sont disponibles dans le
paquet ocaml et menhir peut également se trouver dans le gestionnaire de
paquets.

(Testé sous Ubuntu 12.04)

#### Sous Windows ####
Pour installer make :  
	http://gnuwin32.sourceforge.net/packages/make.htm

Pour installer ocaml (contenant ocamlopt et ocamldep) :  
	http://protz.github.io/ocaml-installer/

Pour installer menhir, il faut compiler les sources se trouvant ici :  
	http://gallium.inria.fr/~fpottier/menhir/menhir.html.fr

(Testé sous Windows 7 avec mingw32-make au lieu de GNUmake)

#### Sous MacOS ####
(J'ai pas de Mac sous la main pour tester)

### Compilation ###
 * Taper `make sim` après s'être placé dans le dossier contenant les sources
pour uniquement compiler le programme `sim`.
 * Taper `make all` (ou juste `make`) pour compiler puis lancer un exemple
d'utilisation.

Le programme `sim` ainsi créé est autonome.



## Utilisation ##
### Fonctionnement général ###
Sim prend en entrée les fichiers suivants :

 * Un fichier netlist contenant la description du circuit (non ordonnée)
 * Un fichier décrivant la ROM (facultatif)

Le fichier ROM est facultatif. S'il n'existe pas, un avertissement est affiché
dans la console mais la simulation est tout de même effectuée. La ROM est alors
identiquement nulle.


### Syntaxe des différents fichiers ###
La syntaxe de la netlist peut se trouver ici : (en seconde partie)  
	http://www.di.ens.fr/~bourke/minijazz.pdf

La syntaxe du fichier de description de la ROM est la suivante :

 * Les valeurs sont représentées par des caractères : `1` représente un bit
   activé tandis qu'un `0` représente un bit désactivé.
 * Les espaces et tabulations sont ignorées.
 * Les retours à la ligne annoncent une nouvelle adresse mémoire.
 * Des commentaires peuvent être ajoutés en fin de ligne après le caractère `#`.
 * Une ligne commençant directement par le caractère `#` n'est pas considérée
   comme correspondant à une adresse.
 * Les adresses sont écrite par ordre croissant en partant de 0. Si le fichier
   est plus long que la taille de la rom, le comportement du simulateur n'est pas
   défini.

### Syntaxe de la commande sim ###
Le seul paramètre obligatoire est le fichier netlist à simuler. Sim s'appelle
alors comme suit :

    sim [filename].net

Par défaut, le Sim utilise les fichiers suivants :

 * `rom.sim` pour la rom

Pour modifier le fichier de description de la rom, utiliser l'option
`-rom [filename].sim`.

L'opération d'ordonnement de la netlist peut s'avérer très coûteuse en temps,
c'est pourquoi on peut choisir de sauvegarder la netlist ordonnée à l'aide de
l'option `--schedule-only`. Dans ce cas, l'étape de simulation n'est pas effectuée
et la netlist ordonnée est enregistrée dans `[filename].sch.net`.

Lorsque l'on veut utiliser un fichier netlist déjà ordonné, il utiliser l'option
`--sim-only`. À ce moment, si la netlist n'a pas préalablement été ordonnée, il
peut y avoir des erreurs diverses. Le plus simple est de n'utilise cette option
que lorsque le fichier termine par `.sch.net` afin d'éviter les confusions.

## Informations complémentaires ##
### Bugs connus ###
Certaines boucles combinatoires peuvent ne pas être détectées par le détecteur
de boucles combinatoires.

Mettre une nappe de taille nulle en sortie génère l'exception Not_found.

