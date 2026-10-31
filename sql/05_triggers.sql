-- 05_triggers.sql

-- TRG_CHECK_CAR_OVERLAP: blocks a booking when the same car already has a BOOKED or ACTIVE
-- booking that overlaps the requested period.
-- A compound trigger is used on purpose: a plain row-level trigger that queries BOOKINGS
-- would fail with ORA-04091 (mutating table). Rows are collected in "after each row" and
-- checked once in "after statement".
create or replace trigger TRG_CHECK_CAR_OVERLAP
for insert or update on BOOKINGS
compound trigger
    type t_booking is record (booking_id number , car_id number , start_datetime timestamp , end_datetime timestamp);
    type t_bookings is table of t_booking index by pls_integer;
    g_bookings t_bookings;

    after each row is
    begin
        if :new.status in ('BOOKED', 'ACTIVE') then
            g_bookings(g_bookings.count + 1).booking_id     := :new.booking_id;
            g_bookings(g_bookings.count).car_id             := :new.car_id;
            g_bookings(g_bookings.count).start_datetime     := :new.start_datetime;
            g_bookings(g_bookings.count).end_datetime       := :new.end_datetime;
        end if;
    end after each row;

    after statement is
        v_count number;
    begin
        for i in 1 .. g_bookings.count loop
            select count(*) into v_count
            from BOOKINGS
            where car_id = g_bookings(i).car_id
              and booking_id != g_bookings(i).booking_id
              and status in ('BOOKED', 'ACTIVE')
              and start_datetime < g_bookings(i).end_datetime
              and end_datetime > g_bookings(i).start_datetime;

            if v_count > 0 then
                raise_application_error(-20001, 'Car is already booked in this period');
            end if;
        end loop;
    end after statement;
end TRG_CHECK_CAR_OVERLAP;
/
