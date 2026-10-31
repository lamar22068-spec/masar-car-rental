# Masar

A car rental management system I built with Oracle Database, PL/SQL and Oracle APEX. It's a portfolio project, so I tried to build it the way a small rental office would actually need it.

![Home](app imag/home.png)

## What it does

- Manage cars, customers and bookings
- The price is calculated automatically when you pick a car and the dates
- You can't book the same car twice for overlapping dates
- Returning a car calculates the late fee and makes the car available again
- Dashboard with revenue and fleet stats, visible to managers only
- Three roles: Administrator, Contributor and Reader
- English and Arabic, the whole page flips to right-to-left when you switch

## Screenshots

**Bookings**

![Bookings](app imag/bookings.png)

**Dashboard**

![Dashboard](app imag/dashboard.png)

**Customers**

![Customers](app imag/customers.png)

**Arabic version**

![Arabic](app imag/arabic.png)

## Database

8 tables: branches, car categories, cars, customers, employees, bookings, payments and maintenance logs.

<details>
<summary>ERD (click to open)</summary>

```mermaid
erDiagram
    BRANCHES ||--o{ CARS : has
    BRANCHES ||--o{ EMPLOYEES : employs
    CAR_CATEGORIES ||--o{ CARS : classifies
    CARS ||--o{ BOOKINGS : booked_in
    CUSTOMERS ||--o{ BOOKINGS : makes
    EMPLOYEES ||--o{ BOOKINGS : registers
    BOOKINGS ||--o{ PAYMENTS : paid_by
    CARS ||--o{ MAINTENANCE_LOGS : serviced_in

    BRANCHES {
        number branch_id PK
        string branch_name
        string city
        string address
        string phone
    }
    CAR_CATEGORIES {
        number category_id PK
        string category_name
        number daily_rate
        number late_fee_per_day
    }
    CARS {
        number car_id PK
        number branch_id FK
        number category_id FK
        string plate_number
        string brand
        string model
        number manufacture_year
        string color
        number mileage
        string status
    }
    CUSTOMERS {
        number customer_id PK
        string full_name
        string national_id
        string phone
        string email
        string license_number
        date license_expiry
        timestamp created_at
    }
    EMPLOYEES {
        number employee_id PK
        number branch_id FK
        string full_name
        string email
        string role
        date hire_date
    }
    BOOKINGS {
        number booking_id PK
        number car_id FK
        number customer_id FK
        number employee_id FK
        timestamp start_datetime
        timestamp end_datetime
        timestamp actual_return_datetime
        number total_price
        number late_fee
        string status
    }
    PAYMENTS {
        number payment_id PK
        number booking_id FK
        number amount
        string payment_method
        timestamp payment_datetime
    }
    MAINTENANCE_LOGS {
        number maintenance_id PK
        number car_id FK
        string description
        number cost
        date start_date
        date end_date
    }
```

</details>

The logic that lives in the database:

- `CALC_PRICE` (function): daily rate of the car category times the number of days
- `RETURN_CAR` (procedure): saves the return, works out the late fee, closes the booking and frees the car
- `TRG_CHECK_CAR_OVERLAP` (trigger): rejects overlapping bookings for the same car. It's a compound trigger because a normal row-level trigger that reads the same table gives ORA-04091
- `BOOKING_DETAILS` (view): bookings joined with customer, car, employee and how much was paid

## Run it yourself

1. Make a free workspace on [apex.oracle.com](https://apex.oracle.com)
2. Go to SQL Workshop > SQL Scripts and run the files in `sql/` in this order: `01_create_tables`, `02_sample_data`, `03_view`, `04_functions_procedures`, `05_triggers`
3. Import the app from the `apex/` folder (App Builder > Import)
4. In Application Access Control, give your user the Administrator role

`00_drop_all.sql` wipes everything, `06_practice_queries.sql` has some example queries and `07_tests.sql` has the tests I used for the price function, the trigger and the return procedure.

## About me

I'm Lamar.

- GitHub: [lamar22068-spec](https://github.com/lamar22068-spec)
- LinkedIn: [Lamar Alhawasawi](https://www.linkedin.com/in/lamar-alhawasawi-681641315)
