# Devlog de sysdig
Projet de simulation d'un microprocesseur
(cf README)

## 02/11/2013 (Jour 3)
À ce jour, le simulateur fonctionne sur tous les exemples sans ram/rom
Les registres viennent d'être ajoutés.

### Organisation des fichiers
Le fichier `core.ml` gère le cœur du simulateur : la fonction `tic` dont le rôle
est d'exécuter une itération du circuit sur un jeu d'entrées donné. Le fichier
principal (`main.ml`) gère les arguments passés à la commande `sim` (programme
final) et organise les équations avec `schedule` et dialogue avec `tic`. Les
autres fichiers proviennent du TD1.

La compilation se fait à l'aide de la commande `make`. Je n'ai pas utilisé
`ocamlbuild` car je maîtrise moins son fonctionnement et que l'apprentissage
de la syntaxe des `Makefile` est de toute façon nécessaire pour de nombreuses
situations.

Pour ne conserver que les fichiers de développement, utiliser la commande
`make clean`. Il est important de nettoyer les fichiers générés avant de faire
un commit afin d'éviter de remplir le dépôt de fichiers inutiles au
développement. Le dépôt doit être utilisé pour le développement et non la
diffusion du programme et on ne doit donc pas avoir à faire sans cesse le tri
entre fichiers « intéressants » et fichiers générés qu'il ne sert à rien
d'ouvrir.

### Gestion des registres
Dans le graphe de dépendance, il faut bien ajouter les registres et mémoires
comme les autres (pour définir les variables au bon moment) mais ne pas ajouter
de liens de dépendance (`reg n` ne nécessite pas de connaître `n`).

Pour gérer les registres, l'ancien environnement est passé en argument de la
commande `tic`. Si `n` n'est pas trouvé dans l'ancien environnement (ce qui
arrive à la première itération, lorsque celui-ci est encore vide, une valeur par
défaut est appliquée (`VBit false` pour un simple bit et
`VBitArray [|false; ...; false|]` pour un groupe de bits).

La fonction `tic` se contente d'exécuter dans l'ordre les équations du programme
et nécessite donc qu'il soit organisé au préalable par la fonction `schedule`.
Les environnements sont gérés par le type `Env` du module `Netlist_ast`.

### Entrées et sorties du programme `sim`
Les entrées doivent être fournies dans un fichier (par défaut `input.txt` mais
il peut être modifié en indiquant son chemin par le paramètre `-input` de `sim`.
De même, la sortie est enregistrée dans le fichier indiqué par le paramètre
`-output`.

La syntaxe de ces fichiers est la suivante :

 - Chaque ligne représente une itération
 - Les valeurs sont inscrites dans l'ordre dans lequel les entrées (resp.
   sorties) sont indiquées dans le fichier NET.
 - Les valeurs peuvent être séparées par un nombre arbitraire d'espaces et de
   tabulations et des commentaires peuvent être ajoutés en fin de ligne après
   le caractère `#`. Si une ligne commence par le caractère `#`, elle est
   entièrement considérée comme un commentaire et ne compte donc pas comme une
   ligne d'itération. C'est en particulier utile pour rappeler en bas du
   fichier la signification des différentes entrées. (Ne fonctionne pas pour la
   première ligne pour le moment)
 - Les valeurs peuvent être soit un bit (`0` ou `1`, les autres caractères
   étant considérés comme des zéros), soit un groupe de bits sous la forme
   `[0 1 0]`, les espaces étant là encore ignorés.

Les valeurs doivent toujours bien correspondre au nombre d'entrées du circuit
ainsi qu'à leur type. Aucune vérification a priori n'est faite pour le moment
mais un mauvais format de données générera une `Sim_error`.

Ce choix de gérer les entrées et sorties dans des fichiers a été fait en
perspective de l'organisation modulaire du projet. En effet, ses différentes
composantes (Simulateur, Microprocesseur, Assembleur, Programme d'horloge)
devront pouvoir communiquer entre elles et pour cela un fichier est plus simple
à gérer que les sortie et entrée standards. Ainsi, l'assembleur (programme)
convertira le fichier .asm en fichier d'entrée de `sim`, en .sim.

La syntaxe des fichiers est suffisamment simple pour pouvoir être parsée
uniquement avec un lexeur et être rapidement rédigée mais permet tout de même
d'être un minimum clair grâce à la possibilité de commenter.

Il est à noter que la gestion de l'ordre des valeurs a été une source d'erreur
lors de la lecture des fichiers et l'enregistrement des données dans les listes
à envoyer à la fonction `tic`. La présence des `List.rev` qui en découle peut
peut-être être optimisée.

### Gestion de la mémoire
La mémoire est enregistrée dans une table de hachage.
Dans quel sens sont notées les adresses ? J'ai pris pour convention que
`addr[0]` est le bit de poids faible.
La mémoire est initialisée à 0.

### TODO
 - Ajouter une commande pour utiliser plutôt des fichiers d'entrée/sortie
   préfixés. *ok*
 - Localiser et préciser les erreurs. *ok*
 - Gérer RAM et ROM. (Hash table ou Map ? -> Hash table pour la ROM qui est en
lue plus souvent qu'écrite) *ok*
 - Gérer la possibilité d'entrer les données au clavier et de lire la sortie
   dans la console. *abandonné*
 - Bit tricks pour les slices ? *abandonné*
 - Écrire le fichier NET « schédulé ». *ok*
 - Régler le problème de .depend dans make clean. **TODO**
 - Ajoute une ligne make run au Makefile pour lancer un petit exemple et
   vérifier que la compilation s'est bien déroulée. *ok*
 - Vérifier les données d'entrée ? *ok*
 - Trouver une regexp pour matcher le début du fichier. (`_#_` semble ne pas
fonctionner.) *abandonné au profit d'une autre solution*


## 03/11/2013 (Jour 3.5)
Le compilateur mjc semble préférer `SELECT 1 foo` à `SLICE 1 1 foo`. Il faut en
conclure que `SELECT` peut se faire sur un bit simple et pas uniquement sur un
groupe de bits. `[|b|]` et `b` sont donc identifiés.
Comment est gérée réellement la distinction entre `foo : 1` et `foo` ?
En fait je n'ai pas utilisé p.p_vars... c'est là qu'il faut gérer les types e
vérifier les erreurs.

Flag -sch pour exporter le fichier .net ordonné ajouté.

Problème avec le scheduler...
Ligne 11 et 14 dans ram.net : remplacer `_l_14` par `o` pour éviter les boucles.
Pourquoi le compilateur mjc a-t-il fait ça ? Mais aussi pourquoi le scheduler
ne l'a-t-il pas détecté ? Il est pourtant clair qu'il y a des boucles de
dépendances sinon (ex: `_l_14` -> `_l_7_21` -> `_l_9_19`).
Peut-être tester sur un exemple plus simple.

## 05/11/2013 (Jour 4)
Le fichier `ram.net` ne correspondait en effet pas au compilé du fichier
`ram.mj`.
J'ai également remplacé `and` par `or` dans `or_n<n>`, d'une part pour que le
circuit corresponde à son nom et également parce que, initialisant la mémoire à
0, le circuit résultant était inintéressant (on ne pouvait enregistrer d'autres
valeurs que 0).

Il restait un problème de liste retournée dans la lecture des bit arrays dans
le fichier d'input.

Il y a sensiblement un problème avec la gestion de l'environnement : seule la
valeur de `c` à la première itération est prise en compte dans la simulation de
`ram.net`.
Dédoublement de la table de hachage de la ram  en `ram` et `newRam` pour
conserver l'ancienne valeur de la mémoire à la lecture.
**Problème** : Comment la ram doit-elle être gérée ? Doit-on considérer qu'il y
a un registre devant l'entrée de la ram ou juste que l'on fait les
enregistrement en fin d'itération ? Dans le premier cas, le write enable doit-il
lui aussi être retardé (plus instinctif) ?
Ajout d'une branche pour tester le second cas.

Le second cas est plus convaincant, mais je conserve les deux en attendant.
Le premier cas a été placé dans une branche `ram_avec_registres` tandis que
l'autre a été fusionnée avec `master`.

Il n'est en fait pas possible de mettre plusieurs lignes de commentaires de
suite dans un fichier `.sim`... <= Corrigé
Reste le problème des commentaires en début de fichier. Peut-être faut-il revoir
tout `input.mll` et ajouter une règle `comment`.

La rom doit être préenregistrée. Gérer un fichier `rom.sim` contenant la rom.
Du coup `input.mll` pourrait être renommé `sim_lexer.mll` pour factoriser les
lectures de fichiers .sim.

Les mots en mémoire sont-ils sur plusieurs adresses ou une seule ? Comment
connaître la taille des mots a priori ?

**Solution** : Faire des tables de hachage de `Netlist_ast.value` et non de
`bool` !

On tronque ou complète arbitrairement (on suppose les poids faibles à droite)
les entrées et sorties de la mémoire. Ces situations ne sont censées arriver en
pratique que lorsque la valeur de la mémoire n'est pas initialisée si on
conserve dans tout le circuit la même `wordSize`.

Ajout de l'option `-p` : Les valeurs par défaut de `input_file`, `output_file`
et `rom_file` deviennent respectivement `filename_input.sim`,
`filename_output.sim` et `filename_rom.sim`. Ça permet de conserver en parallèle
les fichiers input et rom pour plusieurs circuit différents sans avoir à
spécifier à `sim` les paramètres `-input`, `-output` et `-rom` en permanence.

Les commentaires dans les fichiers .sim sont désormais entièrement fonctionnels.

`TBitArray 1` est désormais différent de `TBit`.
Avertissement ajouté lorsque de mauvaises données sont contenues dans
`input.sim`.

Dans `core.ml`, les procédures ne nécessitant pas d'être englobées dans `tic`
en ont été sorties. Les erreurs dans le fichier d'input sont désormais plus
claires et localisées.


## 06/11/2013 (Jour 5)
Dernières vérifications. `make sim` remplace `make all` et `make all` remplace
`make run` (c'est visiblement plus idiomatique).
Problème de `.depend` réglé grâce à `$(MAKECMDGOALS)`.

Il ne reste plus qu'à tester des exemples divers et tordus !



## 26/12/2013 (et résumé des jours précédents)
Il y a eu divers problèmes depuis le dernier rendu. Le premier est un problème
de détection des cycles en présence de registres et de mémoires. Le scheduler
était resté à une ancienne version et le détecteur de cycles était bogué.

D'autre part, étant donné que l'on va utiliser le piping pour faire communiquer
les différentes parties du projet (acquisition de données de l'horloge, simuation
du processeur et sortie de données. On a pour cela besoin de modifier le simulateur
afin qu'il utilise l'entrée et la sortie standards pour communiquer. Il y a donc
plein de paramètres à retirer (choix des fichiers d'entrée et de sortie, de l'export
ou non du fichier schedulé, etc. De plus, on ne veut plus gérer la simulation en
nombre de cycles mais plutôt faire tourner l'application jusqu'à ce que le programme
termine. On utilise alors une sortie spéciale pour indiquer si la machine doit
être éteinte.

Le format .sim n'étant plus utilisé que pour la rom, on peut le simplifier.
En effet, il était à l'origine prévu pour l'entrée de donnée et utilisé par la rom
pour éviter d'avoir à refaire un nouveau parseur mais n'était alors pas utilisé
au maximum de ses capacités et les crochets par exemples peuvent être retirés.
On conserve tout de même les commentaires afin de générer avec l'assembleur un
code annoté.

## 28/12/2013
Pour le piping, j'utilise et découvre le module `Stream` avec `stdin`.

**Problème** : Le piping ne convient pas à notre problème car attend que la
première application s'arrête avant de lancer la seconde ! Il faut impérativement
trouver un nouveau protocole de communication.




