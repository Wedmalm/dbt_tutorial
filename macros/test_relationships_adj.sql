{% test relationships_adj(model, column_name, field, to) %}
    


select
    from_field

from (
    select {{column_name}} as from_field
    from {{model}}
    where {{column_name}} is not null
) child 
left join (
    select {{field}} as to_field
    from {{to}}
) parent
    on child.from_field = parent.to_field

where parent.to_field is null



{% endtest %}