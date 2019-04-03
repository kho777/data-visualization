'''
## Introduction to Python sample program 4
## file: introPython04.py
## Adapted from "Matplotlib Release 3.0.3" by John Hunter, Darren Dale, Eric Firing, Michael Droettboom 
## and the Matplotlib development team
## Release date: February 28, 2019
## PDF document available at https://matplotlib.org/Matplotlib.pdf

# Python example program 4
# Reading in Excel data 
# Plots using seaborn
'''


# Import modules

import pandas as pd
import seaborn as sns

hpi16= pd.read_excel("https://github.com/kho777/data-visualization/blob/master/data/hpi2016.xlsx?raw=true",sheet_name='Sheet1', index_col=None, na_values=['NA'])

# Exploring data

#List first 5 records
hpi16.head()

# List last 10 records

hpi16.tail(10)

# Making a plot using seaborn:



# Scatterplot
sns.regplot(x="HPI",
                  y="popln",
                  data=hpi16, fit_reg=False)

# Bar Chart
sns.barplot(x="HPI",
                y="GDPPC",
                data=hpi16)

# Joint plot

sns.jointplot(x=hpi16["HPI"], y=hpi16["popln"], kind='kde')

# Custom the inside plot: options are: “scatter” | “reg” | “resid” | “hex”
