'''
## Introduction to Python sample program 1
## file: introPython01.py
## Adapted from "Matplotlib Release 3.0.3" by John Hunter, Darren Dale, Eric Firing, Michael Droettboom 
## and the Matplotlib development team
## Release date: February 28, 2019
## PDF document available at https://matplotlib.org/Matplotlib.pdf

# Python example program 1
# Some basics
# Read in CSV data
'''

# Comment using "#" (one line) or three single quotes "'''" (multiple line)

# Start your Python journey with classic line
print ("Hello Johnny")

# Create variables

x=5
y=3
x*y # Multiplication
x**y # Power
x%y # Modulus: divide the left side by the right side and get the remainder.
x//y # Floor division: divides the number and rounds down.

#Import Python Modules/libraries
import numpy as np
import scipy as sp
import pandas as pd
import matplotlib as mpl
import seaborn as sns

#Read csv file
CO2 = pd.read_csv("https://raw.githubusercontent.com/kho777/data-visualization/master/data/CO2.csv")

#Read other formats
#pd.read_excel('myfile.xlsx',sheet_name='Sheet1', index_col=None, na_values=['NA'])
#pd.read_stata('myfile.dta')
#pd.read_sas('myfile.sas7bdat')

x=CO2["CO2pc"]

print(x)