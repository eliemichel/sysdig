#!/usr/bin/env python
# -*- coding: utf8 -*-

# commencer par
# sed -e "s/\r/\n/g" ../final/run.out.log | sed 1,2d | sed -e "s#^..\/..\/....  ..:.\?..:\(..\)     \[\(.*\)\].*#\1 \2#" > log

from matplotlib import pyplot


f = open('log', 'r')


t0 = 0.
oldt = 0.
s = 0
olds = -1
globs = 0

time = []
clock = []

for line in f:
	data = line.split(" ")
	s = int(data[0])
	t = float(data[1]) - t0
	if olds < 0:
		t0 = t
	if s != olds:
		if globs % 60 != s:
			raise Exception('Second count synchronisation lost :', globs, s)
		
		
		time.append(t - 1e-9)
		clock.append(globs - oldt)
		globs += 1
		time.append(t)
		clock.append(globs - t)
		oldt = t
	olds = s

f.close()


pyplot.plot(time, clock, 'r-')
pyplot.ylabel('Clock delay (s)')
pyplot.xlabel('Time (s)')
pyplot.grid(True)
#pyplot.axis([0,12,-20,30])
pyplot.show()


