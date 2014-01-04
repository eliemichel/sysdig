
# Répertoire final #

## Informations générales ##

Ce répertoire le script `run` lançant la simulation complète de l'horloge sur le
microprocesseur. Ce script est en réalité très simple :

	./input | ./core | ./output

Il fait simplement communiquer par piping le programme gérant la génération des
entrées du circuit (l'horloge physique), le simulateur à proprement parler ainsi
que le programme affichant la sortie du circuit.

Ces trois parties sont chacunes décrites dans leur script propre afin de simplifier
les tests. Il suffit ainsi de modifier un de ces scripts pour regarder des entrées
différentes par exemple, ou utiliser un afficheur différent.

Ce script ne fonctionne pas sous Windows car ce dernier ne supporte pas le piping,
c'est pourquoi il sera peut-être remplacé à terme par un programme équivalent
multiplateforme (*Ndlr* : se renseigner sur `Unix.pipe` &co).

## Notes supplémentaires ##

Il est possible que vous rencontiez l'erreur suivante ou une variation :

	./run: Permission non accordée

Cela signifie que le fichier `run` n'est pas indiqué comme étant exécutable. Pour
y remédier, il suffit d'appeler la commande `chmod` avec le paramètre `+x`
(e**x**écution) :

	chmod +x run

Il est possible que vous ayez alors à effectuer cette même action pour d'autres
fichiers, comme `input`, `core`, `output` ou encore `input/read_serial.py`.

