sysdig
======

Projet de Système Digital 2013


par Louis Garrigue, Nicolas Jeannerod, Aurélien Delobelle et Elie Michel



Première étape : Simulateur de circuits
---------------------------------------

Les sources du simulateur de circuit ainsi que les informations nécessaires à
son utilisation se trouvent dans le dossier `/sim` visible
[ici](https://github.com/eliemichel/sysdig/tree/master/sim).



Deuxième étape : Microprocesseur
--------------------------------

Le microprocesseur se décompose en plusieurs fichiers minijazz se trouvant dans
le dossier `/micro`. La décomposition en fichiers n'étant pas comprise dans les
spécificité du langage minijazz, nous avons développé un petit utilitaire documenté
dans `/mjdep` permettant la fusion dynamique de fichiers minijazz en utilisant les
commentaires.

Les fichiers minijazz sont ensuite compilés en netlist par le programme `mjc.byte` fourni
par T. Bourke (dossier `/minijazz`) afin de pouvoir être simulés.

Troisième étape : Horloge
-------------------------

Le programme de démonstration du microprocesseur doit être une horloge.
Les informations relatives à cette partie du projet se trouvent dans le dossier
`/horloge`.

