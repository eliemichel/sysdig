from math import floor
from time import clock
from sys  import stdout
#"""
t0 = clock()
while 1:
	ellapsed = clock() - t0
	if floor(ellapsed * 2.) % 2 :
		stdout.write('1')
	else :
		stdout.write('0')
"""
while 1:
	for i in range(200):
		stdout.write('1')
	for i in range(200):
		stdout.write('0')
#"""
