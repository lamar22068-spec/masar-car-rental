
-- Example queries on the sample data (joins, aggregation, subqueries).

-- Customers with the cars they booked (3-table join)
select C.full_name , CARS.car_id
from CUSTOMERS C
join BOOKINGS B on C.customer_id = B.customer_id
join CARS CARS on B.car_id = CARS.car_id;

-- Total revenue per branch (by the branch of the employee who registered the booking)
select B.branch_id , sum(P.amount) as revenue
from BRANCHES B
join EMPLOYEES E on B.branch_id = E.branch_id
join BOOKINGS BK on E.employee_id = BK.employee_id
join PAYMENTS P on BK.booking_id = P.booking_id
group by B.branch_id;

-- Cars that were never booked (returns no rows on the sample data)
select C.car_id
from CARS C
where not exists (
                   select 1
                   from BOOKINGS B
                   where B.car_id = C.car_id
                  );

-- Late bookings (still active after the end date)
select *
from BOOKINGS
where end_datetime < SYSTIMESTAMP
and status = 'ACTIVE';

-- Remaining amount per booking
select B.booking_id , B.total_price + B.late_fee - NVL(SUM(P.amount), 0) as remaining_amount
from BOOKINGS B
left join PAYMENTS P on B.booking_id = P.booking_id
group by B.booking_id , B.total_price , B.late_fee;
