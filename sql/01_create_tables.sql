create table BRANCHES (branch_id number generated always as identity primary key ,
                       branch_name varchar2(100) not null ,
                       city varchar2(50) not null ,
                       address varchar2(200) not null ,
                       phone varchar2(20) not null
                       );

create table CAR_CATEGORIES (category_id number generated always as identity primary key ,
                             category_name varchar2(50) unique not null,
                             daily_rate number(8,2) check (daily_rate > 0) not null,
                             late_fee_per_day number(8,2) check (late_fee_per_day >=0) not null
                            );

create table CARS (car_id number generated always as identity primary key ,
                   branch_id number not null ,
                   category_id number not null ,
                   plate_number varchar2(20) unique not null ,
                   brand varchar2(50) not null ,
                   model varchar2(50) not null ,
                   manufacture_year number(4) check (manufacture_year >= 2000) ,
                   color varchar2(30) ,
                   mileage number(8) check (mileage >= 0) ,
                   status varchar2(20) default 'AVAILABLE' not null check (status in ('AVAILABLE', 'RENTED', 'MAINTENANCE')) ,
                   constraint FK_BRANCHES foreign key (branch_id) references BRANCHES (branch_id) ,
                   constraint FK_CAR_CATEGORIES foreign key (category_id) references CAR_CATEGORIES (category_id)
                   );

create table CUSTOMERS (customer_id number generated always as identity primary key,
                        full_name varchar2(100) not null,
                        national_id varchar2(20) unique not null,
                        phone varchar2(20) not null,
                        email varchar2(100),
                        license_number varchar2(30) not null,
                        license_expiry date not null,
                        created_at timestamp default systimestamp);

create table EMPLOYEES (employee_id number generated always as identity primary key,
                        branch_id number references BRANCHES(branch_id) not null,
                        full_name varchar2(100) not null,
                        email varchar2(100) unique,
                        role varchar2(20) check (role in ('EMPLOYEE', 'MANAGER')),
                        hire_date date);

create table BOOKINGS (booking_id number generated always as identity primary key,
                       car_id number references CARS(car_id) not null,
                       customer_id number references CUSTOMERS(customer_id) not null,
                       employee_id number references EMPLOYEES(employee_id) not null,
                       start_datetime timestamp not null,
                       end_datetime timestamp not null,
                       actual_return_datetime timestamp,
                       total_price number(10,2),
                       late_fee number(10,2) default 0,
                       status varchar2(20) check (status in ('BOOKED', 'ACTIVE', 'RETURNED', 'CANCELLED')) not null,
                       constraint chk_dates check (end_datetime > start_datetime));

create table PAYMENTS (payment_id number generated always as identity primary key,
                       booking_id number references BOOKINGS(booking_id) not null,
                       amount number(10,2) check (amount > 0) not null,
                       payment_method varchar2(20) check (payment_method in ('CASH', 'CARD', 'TRANSFER')),
                       payment_datetime timestamp default systimestamp);

create table MAINTENANCE_LOGS (maintenance_id number generated always as identity primary key,
                               car_id number references CARS(car_id) not null,
                               description varchar2(300) not null,
                               cost number(10,2) check (cost >= 0),
                               start_date date not null,
                               end_date date);
