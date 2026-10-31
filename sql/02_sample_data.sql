begin 
-- BRANCHES
insert into BRANCHES (branch_name , city , address , phone) values ('RentFlow Jeddah' , 'Jeddah' , 'Al Tahlia Street' , '0126001111');
insert into BRANCHES (branch_name , city , address , phone) values ('RentFlow Riyadh' , 'Riyadh' , 'King Fahd Road' , '0115002222');

-- CAR_CATEGORIES
insert into CAR_CATEGORIES (category_name , daily_rate , late_fee_per_day) values ('Economy' , 150 , 30);
insert into CAR_CATEGORIES (category_name , daily_rate , late_fee_per_day) values ('Sedan'   , 220 , 40);
insert into CAR_CATEGORIES (category_name , daily_rate , late_fee_per_day) values ('SUV'     , 350 , 60);
insert into CAR_CATEGORIES (category_name , daily_rate , late_fee_per_day) values ('Luxury'  , 700 , 120);

-- CARS (branch_id , category_id)
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (1 , 1 , 'ABC 1234' , 'Toyota'    , 'Yaris'     , 2022 , 'White'  , 35000 , 'AVAILABLE');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (1 , 1 , 'ABD 2345' , 'Hyundai'   , 'Accent'    , 2023 , 'Silver' , 18000 , 'AVAILABLE');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (1 , 2 , 'BCD 3456' , 'Toyota'    , 'Camry'     , 2021 , 'Black'  , 60000 , 'AVAILABLE');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (2 , 2 , 'CDE 4567' , 'Honda'     , 'Accord'    , 2022 , 'Grey'   , 41000 , 'RENTED');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (2 , 1 , 'DEF 5678' , 'Nissan'    , 'Sunny'     , 2020 , 'White'  , 82000 , 'AVAILABLE');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (1 , 3 , 'EFG 6789' , 'Toyota'    , 'Land Cruiser' , 2023 , 'White' , 22000 , 'AVAILABLE');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (2 , 3 , 'FGH 7890' , 'Hyundai'   , 'Tucson'    , 2022 , 'Blue'   , 37000 , 'RENTED');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (1 , 3 , 'GHJ 8901' , 'Chevrolet' , 'Tahoe'     , 2021 , 'Black'  , 70000 , 'MAINTENANCE');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (2 , 4 , 'HJK 9012' , 'Mercedes'  , 'E-Class'   , 2024 , 'Black'  , 9000  , 'AVAILABLE');
insert into CARS (branch_id , category_id , plate_number , brand , model , manufacture_year , color , mileage , status) values (1 , 4 , 'JKL 0123' , 'BMW'       , '5 Series'  , 2024 , 'Grey'   , 12000 , 'AVAILABLE');

-- CUSTOMERS
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Ahmed Alharbi'   , '1010101010' , '0501111111' , 'ahmed@example.com'  , 'L-100001' , date '2028-05-10');
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Sara Alotaibi'   , '1020202020' , '0502222222' , 'sara@example.com'   , 'L-100002' , date '2027-11-20');
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Khalid Alzahrani', '1030303030' , '0503333333' , 'khalid@example.com' , 'L-100003' , date '2026-12-01');
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Noura Alqahtani' , '1040404040' , '0504444444' , null                 , 'L-100004' , date '2029-02-15');
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Omar Alghamdi'   , '1050505050' , '0505555555' , 'omar@example.com'   , 'L-100005' , date '2027-08-30');
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Lama Alshehri'   , '1060606060' , '0506666666' , 'lama@example.com'   , 'L-100006' , date '2028-01-12');
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Fahad Almutairi' , '1070707070' , '0507777777' , null                 , 'L-100007' , date '2027-04-25');
insert into CUSTOMERS (full_name , national_id , phone , email , license_number , license_expiry) values ('Reem Aldosari'   , '1080808080' , '0508888888' , 'reem@example.com'   , 'L-100008' , date '2029-09-05');

-- EMPLOYEES
insert into EMPLOYEES (branch_id , full_name , email , role , hire_date) values (1 , 'Majed Alsaadi'  , 'majed@rentflow.com'  , 'MANAGER'  , date '2022-01-10');
insert into EMPLOYEES (branch_id , full_name , email , role , hire_date) values (1 , 'Huda Almalki'   , 'huda@rentflow.com'   , 'EMPLOYEE' , date '2023-03-15');
insert into EMPLOYEES (branch_id , full_name , email , role , hire_date) values (2 , 'Sultan Alanazi' , 'sultan@rentflow.com' , 'MANAGER'  , date '2021-06-01');
insert into EMPLOYEES (branch_id , full_name , email , role , hire_date) values (2 , 'Maha Alyami'    , 'maha@rentflow.com'   , 'EMPLOYEE' , date '2024-02-20');

-- BOOKINGS (car_id , customer_id , employee_id)
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (1  , 1 , 2 , timestamp '2026-10-01 10:00:00' , timestamp '2026-10-04 10:00:00' , timestamp '2026-10-04 09:30:00' , 450  , 0  , 'RETURNED');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (3  , 2 , 2 , timestamp '2026-10-05 12:00:00' , timestamp '2026-10-08 12:00:00' , timestamp '2026-10-10 12:00:00' , 660  , 80 , 'RETURNED');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (6  , 3 , 1 , timestamp '2026-10-10 09:00:00' , timestamp '2026-10-15 09:00:00' , timestamp '2026-10-15 08:00:00' , 1750 , 0  , 'RETURNED');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (9  , 4 , 4 , timestamp '2026-10-12 11:00:00' , timestamp '2026-10-16 11:00:00' , timestamp '2026-10-16 10:00:00' , 2800 , 0  , 'RETURNED');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (4  , 5 , 4 , timestamp '2026-10-20 10:00:00' , timestamp '2026-10-25 10:00:00' , null                            , 1100 , 0  , 'ACTIVE');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (7  , 6 , 3 , timestamp '2026-10-18 14:00:00' , timestamp '2026-10-22 14:00:00' , null                            , 1400 , 0  , 'ACTIVE');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (2  , 7 , 2 , timestamp '2026-10-27 10:00:00' , timestamp '2026-10-30 10:00:00' , null                            , 450  , 0  , 'BOOKED');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (10 , 8 , 1 , timestamp '2026-11-01 09:00:00' , timestamp '2026-11-05 09:00:00' , null                            , 2800 , 0  , 'BOOKED');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (5  , 1 , 3 , timestamp '2026-10-14 10:00:00' , timestamp '2026-10-17 10:00:00' , null                            , 450  , 0  , 'CANCELLED');
insert into BOOKINGS (car_id , customer_id , employee_id , start_datetime , end_datetime , actual_return_datetime , total_price , late_fee , status) values (8  , 2 , 1 , timestamp '2026-09-20 10:00:00' , timestamp '2026-09-23 10:00:00' , timestamp '2026-09-23 09:00:00' , 1050 , 0  , 'RETURNED');

-- PAYMENTS (booking_id)
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (1  , 450  , 'CASH'     , timestamp '2026-10-01 10:05:00');
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (2  , 740  , 'CARD'     , timestamp '2026-10-10 12:10:00');
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (3  , 1750 , 'TRANSFER' , timestamp '2026-10-10 09:15:00');
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (4  , 2800 , 'CARD'     , timestamp '2026-10-12 11:10:00');
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (5  , 500  , 'CASH'     , timestamp '2026-10-20 10:05:00');
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (6  , 700  , 'CARD'     , timestamp '2026-10-18 14:05:00');
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (8  , 500  , 'TRANSFER' , timestamp '2026-10-21 16:00:00');
insert into PAYMENTS (booking_id , amount , payment_method , payment_datetime) values (10 , 1050 , 'CASH'     , timestamp '2026-09-20 10:05:00');

-- MAINTENANCE_LOGS
insert into MAINTENANCE_LOGS (car_id , description , cost , start_date , end_date) values (1 , 'Oil change and filter replacement' , 250  , date '2026-08-10' , date '2026-08-10');
insert into MAINTENANCE_LOGS (car_id , description , cost , start_date , end_date) values (3 , 'Brake pads replacement'            , 600  , date '2026-09-01' , date '2026-09-02');
insert into MAINTENANCE_LOGS (car_id , description , cost , start_date , end_date) values (8 , 'Engine inspection and repair'      , 3500 , date '2026-10-21' , null);
end;
commit;

select 'BOOKINGS' as tbl , count(*) as total from BOOKINGS
union all
select 'PAYMENTS' , count(*) from PAYMENTS;
