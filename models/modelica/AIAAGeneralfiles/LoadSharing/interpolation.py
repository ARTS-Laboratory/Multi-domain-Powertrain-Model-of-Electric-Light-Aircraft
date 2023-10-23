from scipy.optimize import curve_fit
from scipy.stats import linregress
import numpy as np
import math as m
import matplotlib.pyplot as plt
import os

def interpolate(manSOC,simSOC,simV,x):
	a=0
	y=0
	while(a<len(simV)):
		if(simSOC[a]>=manSOC[x]):
			y=a
			break
		a=a+1
	iV=(((manSOC[x]-simSOC[y-1])/(simSOC[y]-simSOC[y-1]))*(simV[y]-simV[y-1]))+simV[y-1]
	return iV

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# BEGIN MAIN PROGRAM

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

file = "DischargeComp.csv"
input = open(file, "r")
file = file[:len(file)-4]

manSOC = []
manV = []
simSOC = []
simV = []
intV = []

input.readline()

for line in input:
	splitter = line.split(",") # Split the columns
	if(splitter[0]!=''):
		manSOC.append(float(splitter[0]))
		manV.append(float(splitter[1]))
	simSOC.append(float(splitter[2]))
	simV.append(float(splitter[3]))

x=0
while(x<len(manSOC)):
	iV=interpolate(manSOC,simSOC,simV,x)
	intV.append(iV)
	x=x+1

x=0
output = open("/media/nate/External/loadSharing/DischargeComp_out.csv", "w")
output.write("Man. SOC,Man. V (V),Int. V (V)\n")
while(x<len(manSOC)):
	output.write(str(manSOC[x])+","+str(manV[x])+","+str(intV[x])+"\n")
	x=x+1
