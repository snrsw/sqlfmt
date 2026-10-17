-- https://github.com/tconbeer/sqlfmt/issues/672
FROM Produce
|> WHERE
    item != 'bananas'
    AND category IN ('fruit', 'nut')
|> AGGREGATE COUNT(*) AS num_items, SUM(sales) AS total_sales
   GROUP BY item
|> ORDER BY item DESC;
FROM mydataset.Produce
|> WHERE item != 'bananas' AND category IN ('fruit', 'nut') AND sales > 100 AND quantity > 10
|> AGGREGATE COUNT(*) AS num_items, SUM(sales) AS total_sales, AVG(price) AS average_price GROUP BY item
|> LEFT JOIN (FROM other |> SELECT item, region) AS o USING (item)
|> UNION ALL (SELECT * FROM t2)
|> AS p
|>   ORDER  BY item DESC
|> LIMIT 10;
SELECT a |>> b, c |&> d FROM t
)))))__SQLFMT_OUTPUT__(((((
-- https://github.com/tconbeer/sqlfmt/issues/672
from produce
|> where item != 'bananas' and category in ('fruit', 'nut')
|> aggregate count(*) as num_items, sum(sales) as total_sales
group by item
|> order by item desc
;
from mydataset.produce
|> where
    item != 'bananas' and category in ('fruit', 'nut') and sales > 100 and quantity > 10
|> aggregate
    count(*) as num_items, sum(sales) as total_sales, avg(price) as average_price
group by item
|> left join (from other |> select item, region) as o using (item)
|> union all (select * from t2)
|> as p
|> order by item desc
|> limit 10
;
select a |>> b, c |&> d
from t
