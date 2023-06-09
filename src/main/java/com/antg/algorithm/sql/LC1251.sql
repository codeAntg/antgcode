-- https://leetcode.cn/problems/average-selling-price/
-- 平均售价
select a.product_id
     , round(sum(a.price * b.units) / sum(b.units), 2) average_price
from Prices a
         left join UnitsSold b
                   on a.product_id = b.product_id and (b.purchase_date between a.start_date and a.end_date)
group by a.product_id