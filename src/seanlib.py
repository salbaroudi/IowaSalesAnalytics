
#Makes imports and function calls easier.
#Imports and Settings:
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import altair as alt
from datetime import datetime
from datetime import timedelta


#Settings
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"
alt.renderers.enable('notebook')
alt.data_transformers.enable('default', max_rows=None)
#%matplotlib inline 
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', 40)
pd.set_option('display.width', 1000)


#support functions:

#Signature: DataFrame, String -> DataFrame
#Purpose: Analyse a given numerical series. Construct a pseudo dataframe that mimics Q1,Q2,Q3 from series.
#add additional outlier/point information for Altair to interpret (in the prod_chart) method.
#Note: I assume 1.5*IRQ for the whiskers.
def df_gen(data,colname):
    df = data[colname]
    qDict = {"min":df.min(),
             "q0":0,
             "q1":df.quantile(0.25),
             "q2":df.median(),
             "q3":df.quantile(0.75),
             "q4":0,
             "max":df.max()}
    qDict["q0"] = qDict["q2"] - 1.5*(qDict["q3"] - qDict["q1"])
    qDict["q4"] = qDict["q2"] + 1.5*(qDict["q3"] - qDict["q1"])

    pseudoDF = pd.DataFrame({colname:colname,"datum":[qDict["q0"],qDict["q1"],qDict["q2"],qDict["q3"],qDict["q4"]]})

    if (qDict["min"] < qDict["q0"]): #Draw a Red Line just outside of Q0
         pseudoDF["outlierL"] = qDict["q0"]
    else:
        pseudoDF["min"] = qDict["min"]

    if (qDict["max"] > qDict["q4"]): #Draw a Red Line just outside of Q4
        pseudoDF["outlierR"] = qDict["q4"]
    else: #Draw a blue line for the maximum
        pseudoDF["max"] = qDict["max"]

    return pseudoDF

#Signature: String -> Boolean
#Check to see if a col type is in the given list.
def checklist(x):
    return (x in ["float32","float64","int16","int32","int64"]) #** Reasonable types? Corner Cases? 

def prod_chart(pseudoDF,colname):
    #Dataframe finished, make our chart.
    chart = alt.Chart(pseudoDF)

    #determine domain:
    axisRange = (pseudoDF["datum"].iloc[4]- pseudoDF["datum"].iloc[0])
    lower = pseudoDF["datum"].iloc[0] - axisRange*0.1
    upper = pseudoDF["datum"].iloc[4] + axisRange*0.1

    #make main chart
    mainChart = chart.mark_boxplot(extent=1.5,size=35,clip=True).encode(
        y=alt.Y(colname+":O",axis=alt.Axis(title=" ")),
        x=alt.X('datum:Q',
                scale=alt.Scale(domain=(lower, upper),zero=False),
                axis=alt.Axis(title=" "))).properties(
        height=100, width=400)

    #now lets determine the layers

    lowerLine = 0
    upperLine = 0

    if "outlierL" in pseudoDF.columns:
        lowerLine = chart.mark_rule(color='red').encode(
        x='outlierL:Q',
        size=alt.value(3))    
    if "min" in pseudoDF.columns:
        lowerLine = chart.mark_rule(color='blue').encode(
        x='min:Q',
        size=alt.value(3))

    if "outlierR" in pseudoDF.columns:
        upperLine = chart.mark_rule(color='red').encode(
        x='outlierR:Q',
        size=alt.value(3))
    if "max" in pseudoDF.columns:
        upperLine = chart.mark_rule(color='blue').encode(
        x='max:Q',
        size=alt.value(3))
        
    return (mainChart + lowerLine + upperLine)    

#Signature: DataFrame -> Chart
#Purpose: Extract all numerical columns form a data frame, and make a stacked bar chart for quick comparison
#of data rangers, outliers, bounds etc. This is a visual representation of the describe() method.

def boxplotblast(df):
    #first, identify numerical columns of dataframe
    dTypeSer = df.dtypes
    hold = dTypeSer.apply(checklist) #Ret bool selector
    numCols = df.columns[hold] #return index object; like an array/list
    finalChart = prod_chart(df_gen(df, numCols[0]),numCols[0]) #limit it for now!

    for i,item in enumerate(numCols[1:]):
        currChart = prod_chart(df_gen(df, item), item)
        finalChart = finalChart & currChart
    
    print("Guide: Blue lines indicate max/min value. Red Lines indicate cutoff of outliers.")
    
    return finalChart




