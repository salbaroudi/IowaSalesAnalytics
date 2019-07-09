# Summary of Online Analyses for the ILS Dataset:

## Introduction:

Before I do any analysis on this dataset, it is useful to see what has already been done.
It appears that General Assembly uses this dataset for Data Science projects, as claimed
by [this poster][galink]


Some other users of the dataset have also posted presentations and notebooks on
what they have found. Below lists notes on what I found after a quick google search.
This gives me guidance on pitfalls to watch out for, and things I can try.

## 1 - Jim Lung (Data Science Final Project:)
- Website [here][jllink]
- Goal: Determine the best geographic location in Iowa that
will yield the highest number of liquor sales.
Develop a Statistical Model for Bottle Sales in a given area.
- Method of Model Derivation: Feature Correlation as a guide to find useful features,
stepwise linear regression.

- Facts about the data:
   - Reflects only class  "E" liquor licensees
   - Only for liquor sales, and bottles over 10 percent alcohol.
   - 3.3GB is "too large".
   - possible duplicate rows to remove!

-Data Exploration/Cleanup:
   - checking bottlesize * bottlesold = volume sold (consistency)
   - ensuring financial tranactions add up.
   - before you use features, you should check
   for data set coherence!

- Visualizations:
  - Volume of Liquor vs Year grouped by Catagory of Liquor.
  - Volume of Liquor vs Year, grouped by Top Counties
  - Sales vs year, grouped by catagories of liqour
  - Gallons sold for each city in Polk County,
  bars stacked by whisky Catagory
  - these are pretty simple...

- Model DataFrame Schema:
  - Stepwise regression is used; this is currently out of my scope. I will have to fit and check manually.
  - month, year, city, Categoryname, BottlesSold, Sale.
  - Some fairly advanced metrics are done, including:
  - Variance Inflation Factor: Checks for Multicolinearity:
 an effect where one factor can be strongly predicted by other factors -
 this does not lead to parsimony, and may saturate the model.

 - Ideas:
    - Pull data from one year, and use
    the next year as a test for predictions,
    - Assess the prediction with next years data

## 2 - Iowa Liquor Store Analysis (Aakash Tandel):

This is another General Assembly [project][atlink].
They focus on finding the best location to build
a new liquor store, using a variety of methods.

Aakash (here) focuses on fixing location based
on maximization of sales.

- Data Cleaning Issues:
- 2973 duplicate rows
- there are missing values in places.
- Full Dataset contains 2.7 millon rows.
- summaries and statistics for each column.,
- not assuming that

- Feature Engineering:
  - used dummy variables to represent the
  effects of counties in Linear Model
     - here, he means a 1/0 representation of
     a qualitative or catagorial fact, in
     our regression model. Output is still a
     real number.

- Crafting the Model:
   - Corr() method between features, picked
   them out.
   - Linear Regression with picked features
   and dummies in StatsModel
   - To avoid overfitting, Lasso was used.

- Conclusion: Put a store in Dallas County,
and best way to up sales is to increase number
of bottles sold; this is the main factor predicting sales.

## 3 - Analysis by Jocelyn Ong:

This analyst has their own [website front end][jolink]. High quality presentation.

Goal: "A liquor store owner in Iowa is looking to expand to new locations and has hired you to investigate the market data for potential new locations. The business owner is interested in the details of the best model you can fit to the data so that his team can evaluate potential locations for a new storefront."

If I choose to do a regression, I will consult
this blog for more details. Excellent Write up.

## Next Steps:

- I did not see any clustering analysis done.
- Summary Statistics on KPIs and Derived Quantities.
- General Market analysis (Growth of product catagories, sales year after year.)
- Regression for other usecase scenarios

[galink]:https://medium.com/@aakashtandel/iowa-liquor-store-analysis-670cc249203f
[jllink]: http://rstudio-pubs-static.s3.amazonaws.com/392083_44450dc1463f4a788ed298c2c3b6538d.html#/22
[atlink]: https://github.com/aakashtandel/Iowa-Liquor-Sales/blob/master/Client%20Materials/Presentation%20Project%202%20-%20Modeling%20Iowa%20Liquor%20Sales%20-%20Aakash%20Tandel.pdf
[jolink]: https://github.com/aakashtandel/Iowa-Liquor-Sales/blob/master/Code/Project%202%20-%20Modeling%20Iowa%20Liquor%20Sales%20Jupyter%20Notebook.ipynb
