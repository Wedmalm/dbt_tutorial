{% test acceptedvalues_adj(model, column_name, values) %}




select *
from (

    select
        {{ column_name }} as value_field,
        count(*) as n_records

    from {{ model }}
    group by {{ column_name }}

) vals
where value_field not in 
   {{ values }} 






{% endtest %}