-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Check the crime scene report

--Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse.
--Interviews were conducted today with three witnesses who were present at the time — each of their
--interview transcripts mentions the courthouse. 295
SELECT description, id
FROM crime_scene_reports
WHERE street = 'Chamberlin Street' AND day = 28;


-- Check the interviews
-- Sometime within ten minutes of the theft, I saw the thief get into a car in the courthouse parking lot and drive away.
-- If you have security footage from the courthouse parking lot, you might want to look for cars that left the parking lot in that time frame. | Ruth

-- I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at the courthouse,
-- I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money. | Eugene

-- As the thief was leaving the courthouse, they called someone who talked to them for less than a minute.
-- In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
-- The thief then asked the person on the other end of the phone to purchase the flight ticket. | Raymond
SELECT transcript, name
FROM interviews
WHERE transcript LIKE '%courthouse%';


-- Looking into the courthouse_security_logs
SELECT license_plate, activity,hour, minute
FROM courthouse_security_logs
WHERE year = 2020 AND month = 7 AND day = 28 AND activity = 'exit';

-- ATM check

SELECT account_number, transaction_type, amount
FROM atm_transactions
WHERE atm_location = 'Fifer Street' AND year = 2020 AND month = 7  AND day = 28;

--28500762 | withdraw
--28296815 | withdraw
--76054385 | withdraw
--49610011 | withdraw
--16153065 | withdraw
--86363979 | deposit
--25506511 | withdraw
--81061156 | withdraw
--26013199 | withdraw


-- Looking for caller

SELECT caller, receiver, month, day , duration
FROM phone_calls
WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60;

--caller         | receiver       | m | d  | duration
--(130) 555-0289 | (996) 555-8899 | 7 | 28 | 51
--(499) 555-9472 | (892) 555-8872 | 7 | 28 | 36
--(367) 555-5533 | (375) 555-8161 | 7 | 28 | 45
--(499) 555-9472 | (717) 555-1342 | 7 | 28 | 50
--(286) 555-6063 | (676) 555-6554 | 7 | 28 | 43
--(770) 555-1861 | (725) 555-3243 | 7 | 28 | 49
--(031) 555-6622 | (910) 555-3251 | 7 | 28 | 38
--(826) 555-1652 | (066) 555-9701 | 7 | 28 | 55
--(338) 555-6650 | (704) 555-2131 | 7 | 28 | 54


-- Check cars
SELECT *
FROM people
WHERE license_plate IN ( '5P2BI95','94KL13X', '6P58WS2','4328GD8','G412CB7','L93JTIZ','322W7JE','0NTHK55','1106N58');


-- check account numbers
SELECT person_id
FROM bank_accounts
WHERE account_number IN ('28500762','28296815','76054385','49610011','16153065','25506511','81061156','26013199');

-- flights
-- day | hour | minute | origin_airport_id | destination_airport_id| id
--  28 | 8    | 35     | 5                 | 8                     | 27
--  28 | 9    | 28     | 1                 | 8                     | 4
--  28 | 12   | 51     | 1                 | 8                     | 22
SELECT day, hour, minute, origin_airport_id, destination_airport_id, id
FROM flights
WHERE year = 2020 AND month = 7  AND day = 28 AND origin_airport_id = 6;


-- Check the fligh

SELECT full_name, city
FROM airports
WHERE id = 4 ;

-- 5	DFS	Dallas/Fort Worth International Airport	Dallas


-- Passport

SELECT flight_id, seat
FROM passengers
WHERE  passport_number = 5773159633 ;

SELECT name, passport_number
FROM people
WHERE phone_number	 = '(375) 555-8161';

