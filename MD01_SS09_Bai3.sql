create unique index idx_products_category_id_clustered on products(category_id);
cluster products using idx_products_category_id_clustered;

create index idx_products_price_non_clustered on products(price);

select *
from products
where category_id = 10
order by price;