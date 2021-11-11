{{
  config(
    materialized = 'view',
    )
}}

with customers as (
    select * 
    from {{ ref('stg_customers') }}
),


orders as (
    select *
    from {{ ref('stg_orders') }}
),

customer_orders as (
    select *
    from {{ ref('stg_customer_orders') }}
),

final as (
    select c.customerid 
            ,c.name
            ,co.first_order_date 
            ,co.most_recent_order_date 
            ,coalesce(co.number_of_orders, 0) as number_of_orders 
    from customers c
    left join customer_orders co on c.customerid = co.customerid 
)

select * from final 
