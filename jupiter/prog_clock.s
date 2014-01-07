* Met 10 dans r1 (pr sauter 10 instr + tard)
li 1010      *L0    !ce li prend 10 instr
mvar 01

*Regarde ds la mem quelle etait la val prec du quartz=q
*en considerant qu'elle est a l'adr 111, met ds a1
li 111       *L1
mvar 00
load 00

*Teste si a1 = 0, saut si a1 = 1
iio 01

jfra 11    *Saute a 10 instr apres (a L4)

*Met a jour la val stockee du q, a l'adr 111
li 111
mvar 00
input 00
save 00

*Revient au debut (L1), met 0 dans a0 et a1
li 0
mvar 00
mvra 01
li 0 
jaaa    *revient a L0 



*2e partie

*Si on arrive ici, c'est que le q est a 0
*On charge 12 dans r1
li 1100      *L4
mvra 01

*On veut voir si la nouvelle valeur est a 1
input 00    *L2
mvar 00
mvra 01
li 1
and
iio 10

*Saute si q = 1, pas saute sinon, et va 5 instr apres
jfra 11

*Si q = 0 encore, on va revenir a L2
li 10001
jbra 00     *revient 17 instr avant, a L2

*3e partie
*Si on arrive la, c'est qu'on est passe de 0 a 1, on incremente

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

	*Comparer a0 = s et 59
li 111011     *59 dans a0
mvra 11       *s  dans a1
sub           *59-s dans r1
mvra 10
mvar 01
li 10001      *Charge 17
iio 11        *Saute prochaine instr si s <> 59

jbra 00       *Saute a L5

	*Si on est la, s <> 59, on l'incremente simplement
li 110        *
mvar 00
load 01
li 1
add
output 011    *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 110        *
mvar 00
save 01
	*On flip et retourne ensuite au tout debut, L0
li 0
mvar 00
mvra 01
li 0          * adresse de L0
flip
jaaa

	*Si on arrive la, s = 59, on met s = 0
li 110        *L5
mvar 00
li 0
save 00
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
output 011    *Incremente dans la mem spec
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
output 110    *Incremente dans la mem spec
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
load 00
mvar 01

	*Comparer a0 = j et 30
li 11110      *30 dans a0
mvra 11       *j  dans a1
sub           *30-j dans r1
mvra 10
mvar 01
li 10001      *Charge 17
iio 11        *Saute prochaine instr si j <> 30

jbra 00       *Saute a L5

	*Si on est la, j <> 30, on l'incremente simplement
li 100        *
mvar 00
load 01
li 1
add
output 110    *Incremente dans la mem spec
mvra 01       *Incremente dans la mem normale
li 100        *
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
output 1      *Incremente dans la mem spec
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
output 1      *Incremente dans la mem spec
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
