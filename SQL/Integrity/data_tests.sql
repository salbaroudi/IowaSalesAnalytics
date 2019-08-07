/*
 In this file, we query the database and apply a number of test conditions.
 Before the data can be used for Clustering and Regression, we need to verify its
 accuracy and integrity. We can't just take the column names and what they are supposed
 to represent at face value. For all we know, the data-set is corrupted or nonsense.

 Then, these tests aim to assess data quality.

 Tests not done:
 - unique IDs for Left Join Tables: When we imported, DataGrip did this already.



 */


/* Category Names */

-- join with ilsclean, check for nulls
-- check for nulls


/* County Names */

-- join with ilsclean, check for nulls
-- check for nulls


/* ItemDescriptions */

-- join with ilsclean, check for nulls
-- check for nulls

/* StoreNames */

-- join with ilsclean, check for nulls
-- check for nulls

/* VendorNames */

-- join with ilsclean, check for nulls
-- check for nulls

--
/*ILS Integrity */
-- Bottles Sold * Volume per bottle = volumelitres sold

-- stateretailprice*bottles sold = saleprice

-- check if anything is null.

--

--
