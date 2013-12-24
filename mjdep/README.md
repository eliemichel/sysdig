
# mjdep #

La spécification de minijazz ne permet pas l'inclusion de fichiers les uns dans
les autres. Cette fonctionnalité est pourtant utile, d'une part pour bien découper
le code, mais surtout pour pouvoir travailler à plusieurs sans avoir besoin de
passer du temps à fusionner à la main les fichiers à chaque fois que l'on regroupe
le travail de chacun.

mjdep est un utilitaire qui regroupe des fichiers dans le but de les compiler ensuite
en netlist avec mjc. Il utilise pour cela des méta-commentaires.

## Utilisation ##

mjdep prend en paramètre le nom du fichier principal, celui qui appelle les autres.

Par defaut, il exporte le code complet dans `fullmain.mj`, mais l'option `-o` peut
être utilisée pour spécifier le fichier de sortie.

## Syntaxe ##

mjdep recherche dans les commentaires du fichier minijazz le motif suivant :

	#require(file1, file2, file3)

Le nombre de fichier quelconque et les fichiers peuvent être indiqués avec ou sans
l'extension .mj. Ils peuvent être séparés par des virgules ou simplement par des
espaces.

## Comportement ##

Lorsqu'une erreur est détectée (fichier introuvable ou déjà inclu), mjdep l'indique
dans le fichier de sortie, en commentaire, ainsi que dans la sortie standard, mais
n'arrête pas pour autant la compilation. Ainsi si deux fichiers requierent tous deux
le même fichier tiers, ce dernier est inclu une seule fois sans poser de problème
pour la suite.

Afin d'éviter que plusieurs fonctions `main` se trouvent dans le fichier final,
les occurences du mot `main` se trouvant dans les fichiers inclus sont toutes
remplacées par `main_protected`. Attention cependant : ce mot est remplacé quelque
soit son rôle dans le code et pas uniquement pour la déclaration de fonction.


