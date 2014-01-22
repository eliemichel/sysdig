from math import floor
from time import clock
from sys  import stdout
"""
max_t = 10.

t0 = clock()
ellapsed = 0.
while ellapsed < max_t :
	ellapsed = clock() - t0
	if floor(ellapsed * 2.) % 2 :
		stdout.write('1')
	else :
		stdout.write('0')
"""
while 1:
	for i in range(100):
		stdout.write('1')
	for i in range(100):
		stdout.write('0')
#"""
