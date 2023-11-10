from scipy.optimize import curve_fit
from scipy.stats import linregress
import numpy as np
import math as m
import matplotlib.pyplot as plt
import os

def f(Tamb,a,b):
	return a*np.exp(b*Tamb)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# BEGIN MAIN PROGRAM

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

directory = "/media/nate/External/loadSharing/PulseTests/5SOC"

R = []
for file in os.listdir(directory):
	if(len(file)!=18):
		continue
		
	input = open(directory + "/" + file, "r")
	file = file[:len(file)-4]

	t = [] # time
	i = [] # current
	v = [] # voltage
	input.readline()
	x=0
	for line in input:
		splitter = line.split(",") # Split the columns
		if(len(i)<1):
			Tamb = float(splitter[5])
		t.append(float(splitter[0]))
		i.append(float(splitter[1]))
		v.append(float(splitter[2]))
		x+=1

	x=0
	v1=0
	v2=0
	r = []
	while(x<len(t)):
		if(abs(i[x])>1):
			y=x
			v1=v[x]
			while(abs(i[y])>1):
				v2=v[y]
				y+=1
			r.append((v2-v1)/i[x])
			x=y
			continue
		x+=1

	x=0
	R0=0
	while(x<len(r)):
		R0=R0+r[x]
		x+=1
	print(R0/len(r),Tamb)
	R.append([R0,Tamb])

popt, pcov = curve_fit(f,R[1],R[0])
print(popt)
