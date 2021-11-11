    select customerid
            ,min(transactiondate) as first_order_date
            ,max(transactiondate) as most_recent_order_date 
            ,count(salesordernumber) as number_of_orders
    from {{ ref('stg_orders') }} 
    group by customerId 