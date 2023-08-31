```sql

CREATE TABLE IF NOT EXISTS product(
   product_id UInt32,
   product_name String,
   price Float64,
) 
ENGINE = MergeTree()

ENGINE = MergeTree()

CREATE TABLE IF NOT EXISTS plan(
   plan_date Date,
   product_id UInt32,
   plan_cnt Int32,
   shop_name String,
) 
ENGINE = MergeTree()

CREATE TABLE IF NOT EXISTS shop_dns(
	shop_id UInt32,
   date Date,
   product_id UInt32,
   sales_cnt Int32,
) 
ENGINE = MergeTree()

CREATE TABLE IF NOT EXISTS shop_mvideo(
	shop_id UInt32,
   date Date,
   product_id UInt32,
   sales_cnt Int32,
) 
ENGINE = MergeTree()

CREATE TABLE IF NOT EXISTS shop_sitilink(
	shop_id UInt32,
   date Date,
   product_id UInt32,
   sales_cnt Int32,
) 
ENGINE = MergeTree()

```

