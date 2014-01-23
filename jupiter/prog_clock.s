** Charge des constantes quand c = 1

incr

*99 dans 111
li 110001   
mvar 01
li 1
mvar 00
mvra 01
mvra 10
shift
mvra 01
li 1
add
mvra 01       *la on a a1 = 99
li 111
mvar 00
save 01

*28 dans 110
li 11100
mvar 01
li 110
mvar 00
mvra 10
save 00

*12 dans 101
li 1100
mvar 01
li 101
mvar 00
mvra 10
save 00

*23 dans 100
li 11101
mvar 01
li 100
mvar 00
mvra 10
save 00

*59 dans 11
li 111011
mvar 01
li 11
mvar 00
mvra 10
save 00

*17 dans 1
li 10001
mvar 01
li 1
mvar 00
mvra 10
save 00


*Calcule l'adresse de l'instr L0 et la met a l'adresse 0
li 111
mvar 01
wca
mvra 11
add
mvra 01
li 0
mvar 00
save 01


***** 1e partie
*Regarde ds la mem quelle etait la val prec du quartz=q
*en considerant qu'elle est a l'adr 111 (c=0), met ds a1

	*Met 10 ds r1 (plus rapide de faire comme ca qu'avec la memoire, devrait suffire)
decr         *L0
li 1010
mvar 01

*Regarde ds la mem quelle etait la val prec du quartz=q
*en considerant qu'elle est a l'adr 111, met ds a1
li 111       *L1
mvar 00
load 01

li 110       *charge 6 dans a0, pour sauter (jfra 6)

iio 01       *Teste si a1 = 0, saut du jfra si a1 = 1

jfra 00      *Saute a 6 instr apres (a L2)

li 111       *Met a jour la val stockee du q, a l'adr 111
mvar 00
input 00
save 00
jbra 11      *revient a L1


***** 2e partie
*Si on arrive ici, c'est que le q (sa val prec) etait a 0 (et c=0)
*On veut voir si la nouvelle valeur est a 1
input 01     *L3
li 1
and
li 110       *6 dans r1
mvar 01

iio 10       *Saute le jbra ssi q = 1

jbra 11      *Ici, q=0, on revient a L3, et q n'a pas besoin d'etre modifie

*Si on arrive la, alors q = 1, il faut actualiser sa valeur avant d'incrementer
li 111       *Met a jour la val stockee du q, a l'adr 111
mvar 00
li 1
save 00


***** 3e partie
*Si on arrive la, c'est qu'on est passe de 0 a 1, on incremente
*c = 0 verifie

*valeur -- adresse
*quartz 111
*j 0
*m 1
*a1 10
*a2 11
*h 100
*mn 101
*s 110

***** s  110

	*Lit s dans r1
li 110        *
mvar 00
load 00
mvar 01

incr          *c=1
	
	*Comparer a0 = s et 59(&59=11)
load2 11 1 0  *59 dans a0
mvra 11       *s  dans a1
sub           *59-s dans a1
mvra 01

load2 1 1 0   *Charge 17
iio 01        *Saute prochaine instr si s <> 59

jfra 00       *Saute a L5 <---

	*Si on est la, s <> 59, on l'incremente simplement

load2 110 0 1 *s dans a1, marche pas avec mvra 11
li 1
add
mvra 00       *<---
output 110    *Incremente dans la mem spec <---
mvra 01       *Incremente dans la mem normale
save2 110 0
	
flip          *On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01       *0 dans a0 et a1
load 00
jaaa

	*Si on arrive la, s = 59, on met s = 0
li 110        *L5
mvar 00
li 0
decr
save 00
incr
output 110    *Mem spec



***** mn  101

	*Lit mn dans r1
li 101        *
mvar 00
load 00
mvar 01

	*Comparer a0 = mn et 59
li 111011     *59 dans a0
mvra 11       *mn dans a1
sub           *59-mn dans r1
mvra 10
mvar 01
li 10001      *Charge 17
iio 11        *Saute prochaine instr si s <> 59

jbra 00       *Saute a L5

	*Si on est la, mn <> 59, on l'incremente simplement
li 101        *
mvar 00
load 01
li 1
add
output 101    *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 101        *
mvar 00
save 01
	*On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01
li 0          * adresse de L0
flip
jaaa

	*Si on arrive la, mn = 59, on met mn = 0
li 101        *L5
mvar 00
li 0
save 00
output 101    *Mem spec




***** h   100

	*Lit s dans r1
li 100        *
mvar 00
load 00
mvar 01

	*Comparer a0 = h et 23
li 11101      *23 dans a0
mvra 11       *h  dans a1
sub           *23-h dans r1
mvra 10
mvar 01
li 10001      *Charge 17
iio 11        *Saute prochaine instr si h <> 23

jbra 00       *Saute a L5

	*Si on est la, h <> 23, on l'incremente simplement
li 100        *
mvar 00
load 01
li 1
add
output 100    *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 001        *
mvar 00
save 01
	*On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01
li 0          * adresse de L0
flip
jaaa

	*Si on arrive la, h = 23, on met h = 0
li 100        *L5
mvar 00
li 0
save 00
output 100    *Mem spec



***** j 0

	*Lit j dans r1
li 0          *
mvar 00
decr
load 00
incr
mvar 01

	*Comparer j et 28
li 110        *28 dans a0
mvra 00
load 00

mvra 11       *j dans a1
sub           *28-j dans r1
mvra 00
not

iio 10        *Saute prochaine instr si j = 28


*a2 11

**** Fevrier ?
*ici j = 28, on teste si on est en fevrier
li 1          * m dans r1
mvar 00
decr
load 00
incr
mvar 01

	*Comparer m et 2
li 110        *28 dans a0
mvra 00
load 00

mvra 11       *j dans a1
sub           *28-j dans r1
mvra 00
not

iio 10        *Saute prochaine instr si j = 28




mvra 11       *j dans a1
sub           *28-j dans r1
mvra 10
mvar 01

li 10001      *Charge 17
iio 11        *Saute prochaine instr si j <> 30

jbra 00       *Saute a L5

	*Si on est la, j <> 28, on l'incremente simplement
li 100        *
mvar 00
load 01
li 1
add
output 0      *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 0          *
mvar 00
save 01
	*On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01
li 0          * adresse de L0
flip
jaaa

	*Si on arrive la, j = 30, on met j = 1
li 100        *L5
mvar 00
li 1
save 00
output 100    *Mem spec



***** m 1

	*Lit m dans r1
li 1          *
mvar 00
load 00
mvar 01

	*Comparer a0 = m et 12
li 1100       *12 dans a0
mvra 11       *m  dans a1
sub           *12-m dans r1
mvra 10
mvar 01
li 10001      *Charge 17
iio 11        *Saute prochaine instr si m <> 12

jbra 00       *Saute a L5

	*Si on est la, m <> 12, on l'incremente simplement
li 1          *
mvar 00
load 01
li 1
add
output 1      *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 1          *
mvar 00
save 01
	*On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01
li 0          * adresse de L0
flip
jaaa

	*Si on arrive la, m = 12, on met m = 1
li 1          *L5
mvar 00
li 1
save 00
output 1      *Mem spec



***** an2  11

	*Lit an2 dans r1
li 11         *
mvar 00
load 00
mvar 01

	*Comparer a0 = an2 et 99
	*Charger 99 (dans a0) :
li 1
mvar 00
mvra 01
li 110011
shift
add           * on a deja 1 dans a1 (hasard)
mvra 00

mvra 11       *an2 dans a1
sub           *99-an2 dans r1
mvra 10
mvar 01
li 10001      *Charge 17
iio 11        *Saute prochaine instr si an2 <> 99

jbra 00       *Saute a L5

	*Si on est la, an2 <> 99, on l'incremente simplement
li 11         *
mvar 00
load 01
li 1
add
output 11     *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 11         *
mvar 00
save 01
	*On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01
li 0          * adresse de L0
flip
jaaa

	*Si on arrive la, an2 = 99, on met an2 = 0
li 11         *L5
mvar 00
li 0
save 00
output 11     *Mem spec




***** an1 10

	*Lit an1 dans r1
li 10         *
mvar 00
load 00
mvar 01

	*Comparer a0 = an1 et 99
	*Charger 99 (dans a0) :
li 1
mvar 00
mvra 01
li 110011
shift
add           * on a deja 1 dans a1 (hasard)
mvra 00

mvra 11       *an2 dans a1
sub           *99-an2 dans r1
mvra 10
mvar 01
li 10001      *Charge 17
iio 11        *Saute prochaine instr si an1 <> 99

jbra 00       *Saute a L5

	*Si on est la, an1 <> 99, on l'incremente simplement
li 10         *
mvar 00
load 01
li 1
add
output 10     *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 10         *
mvar 00
save 01
	*On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01
li 0          * adresse de L0
flip

	*Si on arrive la, an1 = 99, on est dans la mierdasse

end
