----------
-- Step 0 - Create a Query
----------
-- Query: Find a count of `toys` records that have a price greater than
    -- 55 and belong to a cat that has the color "Olive".

SELECT COUNT(*) FROM toys
    JOIN cat_toys ON (toys.id = cat_toys.toy_id)
    JOIN cats ON (cat_toys.cat_id = cats.id)
    WHERE toys.price > 55 AND cats.color = 'Olive';

-- Paste your results below (as a comment):

-- COUNT(*)
-- 215



----------
-- Step 1 - Analyze the Query
----------
-- Query:

EXPLAIN QUERY PLAN
SELECT COUNT(*) FROM toys
    JOIN cat_toys ON (toys.id = cat_toys.toy_id)
    JOIN cats ON (cat_toys.cat_id = cats.id)
    WHERE toys.price > 55 AND cats.color = 'Olive';

-- Paste your results below (as a comment):

--SCAN cat_toys
--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

-- What do your results mean?

    -- Was this a SEARCH or SCAN?

    -- It uses both SEARCH and SCAN


    -- What does that mean?

    -- The query cycles through every record of cat_toys and then uses the cat_id and toy_id to identify the
    -- associated cats and toys



----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

SELECT COUNT(*) FROM toys
JOIN cat_toys ON (toys.id = cat_toys.toy_id)
JOIN cats ON (cat_toys.cat_id = cats.id)
WHERE toys.price > 55 AND cats.color = 'Olive';

-- Paste your results below (as a comment):

-- COUNT(*)
-- 215
-- Run Time: real 0.014 user 0.013345 sys 0.000515



----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

CREATE INDEX idx_toys_price ON toys(price);
CREATE INDEX idx_cats_color ON cats(color);

-- Analyze Query:

EXPLAIN QUERY PLAN
SELECT COUNT(*) FROM toys
    JOIN cat_toys ON (toys.id = cat_toys.toy_id)
    JOIN cats ON (cat_toys.cat_id = cats.id)
    WHERE toys.price > 55 AND cats.color = 'Olive';

-- Paste your results below (as a comment):


-- Analyze Results:

    -- Is the new index being applied in this query?




----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):


-- Analyze Results:
    -- Are you still getting the correct query results?


    -- Did the execution time improve (decrease)?

    -- Execution time increased slightly. Maybe it would be better to do multi-column indexes?


    -- Do you see any other opportunities for making this query more efficient?



---------------------------------
-- Notes From Further Exploration
---------------------------------
