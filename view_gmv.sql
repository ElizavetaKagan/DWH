
CREATE OR REPLACE VIEW public.newview
AS SELECT p.category_id,
    p2.store_id,
    sum(pi2.product_count::numeric * pi2.product_price) AS sales_sum
   FROM purchase_items pi2
     JOIN products p ON pi2.product_id = p.product_id
     JOIN purchases p2 ON pi2.purchase_id = p2.purchase_id
  GROUP BY p.category_id, p2.store_id;