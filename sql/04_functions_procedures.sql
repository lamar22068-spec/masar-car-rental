
-- CALC_PRICE: daily rate of the car's category x number of started days (minimum 1 day).
create or replace function CALC_PRICE (
    p_car_id in number,
    p_start_date in timestamp,
    p_end_date in timestamp
) return number is
    v_daily_rate number(8,2);
    v_days number;
begin
    select c.daily_rate into v_daily_rate
    from CARS car
    join CAR_CATEGORIES c on car.category_id = c.category_id
    where car.car_id = p_car_id;

    v_days := greatest(ceil(cast(p_end_date as date) - cast(p_start_date as date)), 1);

    return v_daily_rate * v_days;
end CALC_PRICE;
/

-- RETURN_CAR: records the return, calculates the late fee (late days x category late fee),
-- closes the booking and makes the car available again.
create or replace procedure RETURN_CAR (
    p_booking_id in number,
    p_actual_return in timestamp default systimestamp
) is
    v_car_id number;
    v_end_datetime timestamp;
    v_late_fee_per_day number(8,2);
    v_late_days number;
    v_late_fee number(10,2) := 0;
begin
    select car_id, end_datetime into v_car_id, v_end_datetime
    from BOOKINGS
    where booking_id = p_booking_id;

    select c.late_fee_per_day into v_late_fee_per_day
    from CARS car
    join CAR_CATEGORIES c on car.category_id = c.category_id
    where car.car_id = v_car_id;

    if p_actual_return > v_end_datetime then
        v_late_days := ceil(cast(p_actual_return as date) - cast(v_end_datetime as date));
        v_late_fee := v_late_days * v_late_fee_per_day;
    end if;

    update BOOKINGS
    set actual_return_datetime = p_actual_return,
        late_fee = v_late_fee,
        status = 'RETURNED'
    where booking_id = p_booking_id;

    update CARS
    set status = 'AVAILABLE'
    where car_id = v_car_id;

    commit;
exception
    when others then
        rollback;
        raise;
end RETURN_CAR;
/
