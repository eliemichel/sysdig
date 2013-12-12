
# Microprocesseur #

Ce dossier regroupe toutes les composantes du microprocesseur sous forme de fichiers
minijazz.

Le makefile permet par l'appelle de la règle `foo` de compléter `foo.mj` tout d'abord
en `foo_full.mj` avec mjdep puis de compiler celui-ci en la netlist `foo_full.net`
qui est finalement simulée avec `sim`.

Si le postfix `_full` ajouté entre en conflit avec le nom de certains fichiers, il peut
être modifié *via* le paramètre `POSTFIX` en première ligne du Makefile.


