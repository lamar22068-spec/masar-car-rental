create or replace view BOOKING_DETAILS as
select
    B.booking_id,
    C.full_name as customer_name,
    CAR.car_id,
    CAR.plate_number,
    E.full_name as employee_name,
    B.start_datetime,
    B.end_datetime,
    B.status,
    B.total_price,
    B.late_fee,
    nvl(P.paid_amount, 0) as paid_amount,
    B.total_price + B.late_fee - nvl(P.paid_amount, 0) as remaining_amount
from BOOKINGS B
join CUSTOMERS C on B.customer_id = C.customer_id
join CARS CAR on B.car_id = CAR.car_id
join EMPLOYEES E on B.employee_id = E.employee_id
left join (
    select booking_id, sum(amount) as paid_amount
    from PAYMENTS
    group by booking_id
) P on B.booking_id = P.booking_id;
