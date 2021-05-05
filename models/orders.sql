with payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        sum(payments.amount) as amount,
        orders.order_date as order_date

    from orders

    left join payments using (order_id)

    where payments.payment_status = 'success'
    group by customer_id, order_id, order_date

)

select * from final