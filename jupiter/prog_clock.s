*Initialisation de la date-heure

*j = 30
li 11110
mvar 01
li 0
mvar 00
mvra 10
save 00
output 0

*m = 12
li 1100
mvar 01
li 1
mvar 00
mvra 10
save 00
output 1

*an2 = 99
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
mvra 00       *la on a a0 = 99
mvar 01
li 11
mvar 00
mvra 10
save 00
output 11

*an1 = 20
li 10100
mvar 01
li 10
mvar 00
mvra 10
save 00
output 10

*****************

*s = 55
li 110111
mvar 01
li 110
mvar 00
mvra 10
save 00
output 110

*mn = 59
li 111011
mvar 01
li 101
mvar 00
mvra 10
save 00
output 101

*h = 23
li 10111
mvar 01
li 100
mvar 00
mvra 10
save 00
output 100

flip

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
li 10111
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

*30 dans 10
li 11110
mvar 01
li 10
mvar 00
mvra 10
save 00

*20 dans 1
li 10100
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

***** 1ere partie (savoir quand on passe de 0 à 1)
decr        *L0
li 111      *old q dans a0
mvar 00     *L1
load 00
input 01    *q dans a1
save 01     *r0 est tjr 111, a1 = q, maj de q
sub
li 111
iio 11
jbra 00     *revient a L1, pas besoin de recharger 111 dans a0


***** 2e partie (incrémentation)
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

load2 1 1 0   *Charge 20
iio 01        *Saute prochaine instr si s <> 59

jfra 00       *Saute a L5 <---

	*Si on est la, s <> 59, on l'incremente simplement
li 110       *s dans a1, marche pas avec mvra 11
mvar 00
decr
load 01       

li 1
add
mvra 00
output 110    *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 110
mvar 00
save 01
incr
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
output 110    *Mem spec

*incr
*c=0


***** mn  101

	*Lit mn dans r1
li 101        *
mvar 00
load 00
mvar 01

incr          *c=1
	
	*Comparer a0 = mn et 59(&59=11)
load2 11 1 0  *59 dans a0
mvra 11       *s  dans a1
sub           *59-s dans a1
mvra 01

load2 1 1 0   *Charge 20
iio 01        *Saute prochaine instr si s <> 59

jfra 00       *Saute a L5 <---

	*Si on est la, s <> 59, on l'incremente simplement
li 101       *s dans a1, marche pas avec mvra 11
mvar 00
decr
load 01       

li 1
add
mvra 00
output 101    *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 101
mvar 00
save 01
incr
flip          *On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01       *0 dans a0 et a1
load 00
jaaa

	*Si on arrive la, s = 59, on met s = 0
li 101        *L5
mvar 00
li 0
decr
save 00
output 101    *Mem spec

*incr
*c=0

***** h 100
	*Lit h dans r1
li 100        *
mvar 00
load 00
mvar 01

incr          *c=1
	
	*Comparer a0 = h et 23(&23=100)
load2 100 1 0 *23 dans a0
mvra 11       *h  dans a1
sub           *59-h dans a1
mvra 01

load2 1 1 0   *Charge 20
iio 01        *Saute prochaine instr si h <> 23

jfra 00       *Saute a L5 <---

	*Si on est la, h <> 23, on l'incremente simplement
li 100       *h dans a1, marche pas avec mvra 11
mvar 00
decr
load 01       

li 1
add
mvra 00
output 100    *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 100
mvar 00
save 01
incr
flip          *On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01       *0 dans a0 et a1
load 00
jaaa

	*Si on arrive la, h = 23, on met h = 0
li 100        *L5
mvar 00
li 0
decr
save 00
output 100    *Mem spec

*incr
*c=0


***** j 0	
	*Lit j dans r1
li 0          *
mvar 00
load 00
mvar 01

incr          *c=1
	
	*Comparer a0 = j et 30(&30=10)
load2 10 1 0  *30 dans a0
mvra 11       *j  dans a1
sub           *30-j dans a1
mvra 01

load2 1 1 0   *Charge 20
iio 01        *Saute prochaine instr si j <> 30

jfra 00       *Saute a L5 <---

	*Si on est la, j <> 30, on l'incremente simplement
li 0         *j dans a1, marche pas avec mvra 11
mvar 00
decr
load 01       

li 1
add
mvra 00
output 0      *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 100
mvar 00
save 01
incr
flip          *On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01       *0 dans a0 et a1
load 00
jaaa

	*Si on arrive la, j = 30, on met j = 1
li 0          *L5
mvar 00
li 1
decr
save 00
output 0      *Mem spec

*incr
*c=0



***** m 1

	*Lit m dans r1
li 1          *
mvar 00
load 00
mvar 01

incr          *c=1
	
	*Comparer a0 = m et 12(&12=101)
load2 101 1 0 *12 dans a0
mvra 11       *m  dans a1
sub           *12-m dans a1
mvra 01

load2 1 1 0   *Charge 20
iio 01        *Saute prochaine instr si m <> 12

jfra 00       *Saute a L5 <---

	*Si on est la, m <> 12, on l'incremente simplement
li 1          *m dans a1, marche pas avec mvra 11
mvar 00
decr
load 01       

li 1
add
mvra 00
output 1      *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 1
mvar 00
save 01
incr
flip          *On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01       *0 dans a0 et a1
load 00
jaaa

	*Si on arrive la, m = 12, on met m = 1
li 1          *L5
mvar 00
li 1
decr
save 00
output 1      *Mem spec

*incr
*c=0



***** an2  11
	*Lit an2 dans r1
li 11         *
mvar 00
load 00
mvar 01

incr          *c=1
	
	*Comparer a0 = an2 et 99(&99=111)
load2 111 1 0 *99 dans a0
mvra 11       *an2 dans a1
sub           *99-an2 dans a1
mvra 01

load2 1 1 0   *Charge 20
iio 01        *Saute prochaine instr si an2 <> 99

jfra 00       *Saute a L5 <---

	*Si on est la, an2 <> 99, on l'incremente simplement
li 11         *an2 dans a1, marche pas avec mvra 11
mvar 00
decr
load 01       

li 1
add
mvra 00
output 11     *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 11
mvar 00
save 01
incr
flip          *On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01       *0 dans a0 et a1
load 00
jaaa

	*Si on arrive la, an2 = 99, on met an2 = 0
li 11         *L5
mvar 00
li 0
decr
save 00
output 11     *Mem spec

*incr
*c=0




***** an1 10

	*Lit an1 dans r1
li 10         *
mvar 00
load 00
mvar 01

incr          *c=1
	*On l'incremente simplement
li 10         *an1 dans a1, marche pas avec mvra 11
mvar 00
decr
load 01       

li 1
add
mvra 00
output 10     *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 10
mvar 00
save 01
incr
flip          *On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01       *0 dans a0 et a1
load 00
jaaa

end
