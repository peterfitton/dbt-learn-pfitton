select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as payment_status,
    amount/100 as amount

from {{ source('stripe', 'payment') }}