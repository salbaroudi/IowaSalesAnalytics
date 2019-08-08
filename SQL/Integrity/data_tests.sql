/*
 In this file, we query the database and apply a number of test conditions.
 Before the data can be used for Clustering and Regression, we need to verify its
 accuracy and integrity. We can't just take the column names and what they are supposed
 to represent at face value. For all we know, the data-set is corrupted or nonsense.

 Then, these tests aim to assess data quality.

 Tests not done:
 - unique IDs for Left Join Tables: When we imported, DataGrip did this already.

 */
/* SUPPORT FUNCTIONS
CREATE OR REPLACE FUNCTION check_nulls (tname text, idcol text, namecol text)
   RETURNS TABLE (
      idnull INT,
      namenull INT
)
AS $$
BEGIN
    SELECT SUM(t1.ids) as idnull, SUM(t1.names) as namenull
    FROM
         (SELECT
                 CASE WHEN idcol IS NULL THEN 15 ELSE 0 END as ids,
                 CASE WHEN namecol IS NULL THEN 15 ELSE 0 END as names
        FROM tname) as t1
    GROUP BY t1.ids;
END; $$
LANGUAGE 'plpgsql';*/


/* Category Names */

-- join with ilsclean, check for nulls



-- check for nulls
SELECT SUM(t1.ids) as idnull, SUM(t1.names) as namenull
FROM
     (SELECT
             CASE WHEN categoryid IS NULL THEN 1 ELSE 0 END as ids,
             CASE WHEN categoryname IS NULL THEN 1 ELSE 0 END as names
     FROM categorynames) as t1
GROUP BY t1.ids;



/* County Names */

-- join with ilsclean, check for nulls
-- check for nulls
SELECT SUM(t1.ids) as idnull, SUM(t1.names) as namenull
FROM
     (SELECT
             CASE WHEN countyid IS NULL THEN 1 ELSE 0 END as ids,
             CASE WHEN countyname IS NULL THEN 1 ELSE 0 END as names
     FROM countynames) as t1
GROUP BY t1.ids;



/* ItemDescriptions */

-- join with ilsclean, check for nulls
-- check for nulls
SELECT SUM(t1.ids) as idnull, SUM(t1.names) as namenull
FROM
     (SELECT
             CASE WHEN itemid IS NULL THEN 1 ELSE 0 END as ids,
             CASE WHEN itemdescription IS NULL THEN 1 ELSE 0 END as names
     FROM itemdescriptions) as t1
GROUP BY t1.ids;



/* StoreNames */

-- join with ilsclean, check for nulls
-- check for nulls
SELECT SUM(t1.ids) as idnull, SUM(t1.names) as namenull
FROM
     (SELECT
             CASE WHEN storeid IS NULL THEN 1 ELSE 0 END as ids,
             CASE WHEN storename IS NULL THEN 1 ELSE 0 END as names
     FROM storenames) as t1
GROUP BY t1.ids;

/* VendorNames */

-- join with ilsclean, check for nulls
-- check for nulls
SELECT SUM(t1.ids) as idnull, SUM(t1.names) as namenull
FROM
     (SELECT
             CASE WHEN vendorid IS NULL THEN 1 ELSE 0 END as ids,
             CASE WHEN vendorname IS NULL THEN 1 ELSE 0 END as names
     FROM vendornames) as t1
GROUP BY t1.ids;


--
/*ILS Integrity */
-- Bottles Sold * Volume per bottle = volumelitres sold
-- stateretailprice*bottles sold = saleprice
SELECT
    t1.volcalc, salecalc, date, invoiceid
FROM
    (SELECT
        CASE WHEN ((bottlessold*bottlevolumeml)/1000) = volumesoldlitre THEN 0 ELSE 1 END as volcalc,
        CASE WHEN statebottleretail*bottlessold = saleprice THEN 0 ELSE 1 END as salecalc,
        date,
        invoiceid
    FROM ils_clean ) as t1
LIMIT 500;

-- check if anything is null.
SELECT SUM(t1.invoiceid),
       SUM(t1.date),
       SUM(t1.city),
       SUM(t1.zipcode),
       SUM(t1.storeid),
       SUM(t1.countyid),
       SUM(t1.categoryid),
       SUM(t1.vendorid),
       SUM(t1.itemid),
       SUM(t1.bottlevolumeml),
       SUM(t1.statebottlecost),
       SUM(t1.statebottleretail),
       SUM(t1.bottlessold),
       SUM(t1.saleprice),
       SUM(t1.volumesoldlitre)
FROM
     (SELECT
             CASE WHEN invoiceid IS NULL THEN 1 ELSE 0 END as invoiceid,
             CASE WHEN date IS NULL THEN 1 ELSE 0 END as date,
             CASE WHEN city  IS NULL THEN 1 ELSE 0 END as city,
             CASE WHEN zipcode IS NULL THEN 1 ELSE 0 END as zipcode,
             CASE WHEN storeid IS NULL THEN 1 ELSE 0 END as storeid,
             CASE WHEN countyid IS NULL THEN 1 ELSE 0 END as countyid,
             CASE WHEN categoryid IS NULL THEN 1 ELSE 0 END as categoryid,
             CASE WHEN vendorid IS NULL THEN 1 ELSE 0 END as vendorid,
             CASE WHEN itemid IS NULL THEN 1 ELSE 0 END as itemid,
             CASE WHEN bottlevolumeml IS NULL THEN 1 ELSE 0 END as bottlevolumeml,
             CASE WHEN statebottlecost IS NULL THEN 1 ELSE 0 END as statebottlecost,
             CASE WHEN statebottleretail IS NULL THEN 1 ELSE 0 END as statebottleretail,
             CASE WHEN bottlessold IS NULL THEN 1 ELSE 0 END as bottlessold,
             CASE WHEN saleprice IS NULL THEN 1 ELSE 0 END as saleprice,
             CASE WHEN volumesoldlitre IS NULL THEN 1 ELSE 0 END as volumesoldlitre
     FROM ils_clean) as t1;