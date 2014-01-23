# Simulateur de netlist Sim #

`sim` est le programme nous permettant de simuler des netlists.


## Installation ##

### Prérequis ###
L'installation nécessite make, ocamlopt, ocamldep, ocamllex et menhir.
Le plus simple est d'utiliser Linux.

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

(Testé sous Windows 7 avec mingw32-make au lieu de GNUmake et avec cygwin)

#### Sous MacOS ####
(J'ai pas de Mac sous la main pour tester)

### Compilation ###
 * Taper `make sim` après s'être placé dans le dossier contenant les sources
   pour uniquement compiler le programme `sim`.
 * Taper `make` (ou `make all`) pour compiler puis lancer un exemple
   d'utilisation.

Le programme `sim` ainsi créé est autonome.



## Utilisation ##
### Fonctionnement général ###
Sim prend en entrée les fichiers suivants :

 * Un fichier netlist contenant la description du circuit (ordonnée ou non)
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
 * La première valeur entrée détermine la taille des mots de la mémoire. Les
   lignes suivantes sont automatiquement tronquées ou complétées par des 0.
   Veillez donc à ce que la première ligne ne soit pas vide !

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

`sim` lit les valeurs des entrées du circuit sur l'entrée standard et écrit celles
des sorties sur la sortie standard (sans retours à la lignes ni espaces dans les
deux cas). L'entrée est lue bloc par bloc sans perdre une seule valeur, et donc
si elle est générée plus vite qu'elle n'est traitée, un délais s'établit entre
la génération et son envoi à la netlist simulée. Si ce comportement n'est pas
souhaité, le paramètre `--async` peut être spécifié au lancement de `sim` afin
de vider l'entrée après l'avoir lue à chaque itération de la simulation. Ainsi
la valeur lue en entrée a toujours été écrite pendant la dernière itération.

## Informations complémentaires ##
### Bugs connus ###
Certaines boucles combinatoires peuvent ne pas être détectées par le détecteur
de boucles combinatoires.

Mettre une nappe de taille nulle en sortie génère l'exception Not_found.

