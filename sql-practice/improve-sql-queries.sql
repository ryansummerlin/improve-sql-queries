----------
-- Step 0 - Create a Query
----------
-- Query: Select all cats that have a toy with an id of 5

SELECT * FROM cats
    JOIN cat_toys ON (cats.id = cat_toys.cat_id)
    WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):

-- 4002|Rachele|Maroon|Foldex Cat|4509|4002|5
-- 31|Rodger|Lavender|Oregon Rex|10008|31|5
-- 77|Jamal|Orange|Sam Sawet|10051|77|5


----------
-- Step 1 - Analyze the Query
----------
-- Query:

EXPLAIN QUERY PLAN
SELECT * FROM cats
    JOIN cat_toys ON (cats.id = cat_toys.cat_id)
    WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):

-- |--SCAN cat_toys
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)


-- What do your results mean?

    -- Was this a SEARCH or SCAN?

    -- It actually uses both. First, it uses SCAN to search every record in cat_toys for a toy_id of 5.
    -- Then, it uses SEARCH to pull the record of each cat given the cat_id where toy_id = 5.

    -- What does that mean?




----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

    SELECT * FROM cats
    JOIN cat_toys ON (cats.id = cat_toys.cat_id)
    WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):

-- id|name|color|breed|id|cat_id|toy_id
-- 4002|Rachele|Maroon|Foldex Cat|4509|4002|5
-- 31|Rodger|Lavender|Oregon Rex|10008|31|5
-- 77|Jamal|Orange|Sam Sawet|10051|77|5
-- Run Time: real 0.001 user 0.000999 sys 0.000228




----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

CREATE INDEX idx_cat_toys_toy_id ON cat_toys(toy_id);

-- Analyze Query:
    -- Your code here

-- Paste your results below (as a comment):

-- |--SEARCH cat_toys USING INDEX idx_cat_toys_toy_id (toy_id=?)
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)
-- Run Time: real 0.000 user 0.000194 sys 0.000043


-- id|name|color|breed|id|cat_id|toy_id
-- 4002|Rachele|Maroon|Foldex Cat|4509|4002|5
-- 31|Rodger|Lavender|Oregon Rex|10008|31|5
-- 77|Jamal|Orange|Sam Sawet|10051|77|5
-- Run Time: real 0.001 user 0.000262 sys 0.000212


-- Analyze Results:

    -- Is the new index being applied in this query?

    -- The new index is being applied and it's much quicker



----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):


-- Analyze Results:
    -- Are you still getting the correct query results?


    -- Did the execution time improve (decrease)?

    -- Execution time is much better now


    -- Do you see any other opportunities for making this query more efficient?

    -- I don't see any opportunities for making it any faster - there are no more SCAN operations that can
    -- be converted to a search


---------------------------------
-- Notes From Further Exploration
---------------------------------
