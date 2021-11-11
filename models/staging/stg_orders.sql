    select so.salesordernumber 
            ,c.customerid
            ,MAX(so.transactiondate) as transactiondate
            ,so.salesorderlinestatus 
    from dedicatedsqlpool.ext.salesorder so 
    inner join dedicatedsqlpool.ext.customer c  on so.deliveryaddressname = c.name 
    group by so.salesordernumber 
                ,c.customerId
                ,so.SalesOrderLineStatus

