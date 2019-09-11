### About this Project:

The original purpose of this project was to attempt to create an
analytics pipeline for the Iowa Liqour Sales Dataset, and display
visuals with a front end (involving Tableau,Flask and Altair+Vega).

I've moved on to other things. Setting up a proper visualizaiton framework for visualizing results is a project on its own, which I will focus on exclusively.

This project demonstrates the following:

1)  Data Cleaning+Tidying using Jupyter notebooks, in discrete stages.

2) Experimentation with DataGrip. Cleaned data was inserted into a Postgresql database. SQL scripts to generate the database, and check the integrity of the data were also produced.

3) Summary Visualizations with Tableau Public, as a final result.

### The Iowa Liquor Sales Dataset:

The Iowa Liquor Sales Data-set contains 12M transactional records for all liquor sales between Jan 2012 - Oct 2017, for the State of Iowa. Numerious types of data are available, including categorial, geo-spatial and sales data.

The dataself itself contains many redundant pieces of information, is mistyped when read in, and somewhat unwieldly to do analysis on in its raw form. It is also fairly large, making an Analyst think twice before they do computationally intensive queries. It is a near perfect data set to learn on.

### The Pipeline:

![Data Pipeline][pline]

All data (initial and processed). Is stored in the **./data** folder. Raw data starts in the **originalcsv** folder. It is then passed through jupyter notebook scripts (as pictured above), and written to intermediate folders (**stage 1 and 2**). From the stage 2 folder, the data cleaning is considered basically done.

After cleaning and tidying, the data is inserted into a Postgresql database using DataGrip . SQL scripts were experimented with, to test database generation and basic integrity tests. The following
table structure was setup, from the cleaned csv files in stage 1 and 2:

![postgres][postgres]

For visualizations, the full dataset caused Tableau Public to run slow. So relevent summaries of the final dataset were generated, to make it easier to work with the data in Tableau. From this, Storyboard visuals were generated, hosted on-line, and then printed to PDF.

### Final Results:

Two PDFs are produced:

1) [Column Boxplots.pdf][cbpdf]: Used to compare each column of data, to get a sense of scale and outliers. Shows the structure of each column (bounded, large tails, stepwise v.s continuous) to get better insight into the data itself.

2) [Data Summary.pdf][dspdf]: Presents high-level summary of the data, including Profit and Sales per geographic region, top performing products and catagories, and sales trends year-over-year.

### Achievements:

- Using join tables, and data type downcasting, a raw 3.6GB table has been converted into a 1.1GB table. This increased performance and made analysis much more simple. This also helped circumvent
the limitations of Tableau Public (slow to load large CSVs).

- A better understanding of setting a data pipeline was aquired.
Project work was greatly accelerated by using PyCharm+DataGrip.
I will be adopting these tools into my workflow.


[pline]: web/img/pipeline.png

[postgres]: web/img/db_diagram.png

[cbpdf]: ./Column_Boxplots.pdf

[dspdf]: ./Data_Summary.pdf
