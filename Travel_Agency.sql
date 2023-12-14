--Create Database Travel_Agency
create database Travel_Agency;
use Travel_Agency;

--Create Tables
create table passengers(
     id int primary key,
     fname varchar(20),
     lname varchar(20),
     email varchar(20),
     password varchar(8),
     phone_no varchar(10),
     age int(2)
     );
create table driver(
     d_id int primary key,
     d_name varchar(20),
     start_date date
     );
create table bus(
     bus_id int primary key,
     bus_name varchar(10),
     driver_id int,
     rating float,
     foreign key(driver_id)references driver(d_id),
     bus_type varchar(10)
     );
 create table transport_agency(
     city varchar(20) primary key,
     branches int,
     drivers int,
     administrative_staff int,
     maintenance_crew int
     );
 create table route(
     route_id int primary key,
     start varchar(10),
     finish varchar(10),
     ac_sleeper float,
     sleeper float,
     ac_seater float,
     seater float,
     foreign key(start)references transport_agency(city)
     );
create table schedule(
     schedule_id int primary key,
     bus_id int,
     r_id int,
     arrival date,
     departure date,
     foreign key(bus_id)references bus(bus_id),
     foreign key(r_id)references route(route_id)
     );
 create table stop(
     location_id int primary key,
     location_name varchar(10),
     route_id int,
     foreign key(route_id)references route(route_id)
     );
create table payment(
    payment_id int primary key,
    passenger_id int,
    amount float,
    payment_date date,
    payment_method varchar(20), -- Add this column for payment method
    foreign key(passenger_id) references passengers(id)
    );

CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    schedule_id INT,
    seat_number INT,
    booking_date DATE,
    payment_id INT,
    FOREIGN KEY (passenger_id) REFERENCES passengers(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
    );


--Insert values into the tables
 insert into passengers values
     (1,"Mala","G.S","malags12@gmail.com","04mysore",8310304649,46),
     (2,"Lakshmi","K.M","laxmikm@gmail.com","athlete",9739748266,19),
     (3,"Sanjana","N","sanju04@gmail.com","icecream",8861815154,24),
     (4,"Chaitra","Ishwar","chaitra@gmail.com","america",7220781463,28),
     (5,"Deepa","S.R","deepa@gmail.com","myself",9984673126,32),
     (6,"Vaishnavi","T.M","vaish@gmail.com","singing",9449804945,21),
     (7,"Gowri","Holla","gowri@gmail.com","bagpack",8894256945,26),
     (8,"Rohan","Bharadwaj","rohan@gmail.com","flower",8046497248,23),
     (9,"Namitha","Kadam","namu@gmail.com","0681door",9831042647,16),
     (10,"Ganavi","Jagadeesha","ganu@gmail.com","46happy",9831903824,63);
 
select *from passengers;
+----+-----------+------------+--------------------+----------+------------+------+
| id | fname     | lname      | email              | password | phone_no   | age  |
+----+-----------+------------+--------------------+----------+------------+------+
|  1 | Mala      | G.S        | malags12@gmail.com | 04mysore | 8310304649 |   46 |
|  2 | Lakshmi   | K.M        | laxmikm@gmail.com  | athlete  | 9739748266 |   19 |
|  3 | Sanjana   | N          | sanju04@gmail.com  | icecream | 8861815154 |   24 |
|  4 | Chaitra   | Ishwar     | chaitra@gmail.com  | america  | 7220781463 |   28 |
|  5 | Deepa     | S.R        | deepa@gmail.com    | myself   | 9984673126 |   32 |
|  6 | Vaishnavi | T.M        | vaish@gmail.com    | singing  | 9449804945 |   21 |
|  7 | Gowri     | Holla      | gowri@gmail.com    | bagpack  | 8894256945 |   26 |
|  8 | Rohan     | Bharadwaj  | rohan@gmail.com    | flower   | 8046497248 |   23 |
|  9 | Namitha   | Kadam      | namu@gmail.com     | 0681door | 9831042647 |   16 |
| 10 | Ganavi    | Jagadeesha | ganu@gmail.com     | 46happy  | 9831903824 |   63 |
+----+-----------+------------+--------------------+----------+------------+------+

 insert into driver values
    (21,"Kumara","2019-01-04"),
    (22,"Raju","2006-08-10"),
    (23,"Vikram","2009-09-18"),
    (24,"Mahesha","2016-11-28"),
    (25,"Rudra","2016-04-24"),
    (26,"Manju","2020-10-06");

 select *from driver;
+------+---------+------------+
| d_id | d_name  | start_date |
+------+---------+------------+
|   21 | Kumara  | 2019-01-04 |
|   22 | Raju    | 2006-08-10 |
|   23 | Vikram  | 2009-09-18 |
|   24 | Mahesha | 2016-11-28 |
|   25 | Rudra   | 2016-04-24 |
|   26 | Manju   | 2020-10-06 |
+------+---------+------------+

 insert into bus values
    (508,"Hiravata",23,9.6,"AC"),
    (4842,"RajExpress",25,8.7,"2decker"),
    (7513,"Sweaty",22,7.5,"1decker"),
    (5360,"Cruzio",24,8.4,"AC"),
    (1624,"BharatBenz",23,9.8,"2decker_AC"),
    (1311,"AshokVK",21,8.2,"2decker"),
    (4376,"Mahindra",24,8.9,"1decker_AC");

 select *from bus;
+--------+------------+-----------+--------+------------+
| bus_id | bus_name   | driver_id | rating | bus_type   |
+--------+------------+-----------+--------+------------+
|    508 | Hiravata   |        23 |    9.6 | AC         |
|   1311 | AshokVK    |        21 |    8.2 | 2decker    |
|   1624 | BharatBenz |        23 |    9.8 | 2decker_AC |
|   4376 | Mahindra   |        24 |    8.9 | 1decker_AC |
|   4842 | RajExpress |        25 |    8.7 | 2decker    |
|   5360 | Cruzio     |        24 |    8.4 | AC         |
|   7513 | Sweaty     |        22 |    7.5 | 1decker    |
+--------+------------+-----------+--------+------------+

 insert into transport_agency values
     ("Mysore",4,20,6,12);
     ("Bangalore",14,48,11,18),
     ("Tumakuru",8,31,10,16),
     ("Hassan",5,19,8,10),
     ("Mangaluru",7,24,9,17),
     ("Udupi",6,18,7,13),
     ("Shivamogga",7,22,9,16),
     ("Belgavi",6,16,8,15),
     ("Vijayapura",5,10,7,12);

select *from transport_agency;
+------------+----------+---------+----------------------+------------------+
| city       | branches | drivers | administrative_staff | maintenance_crew |
+------------+----------+---------+----------------------+------------------+
| Mysore     |        4 |      20 |                    6 |               12 |
| Bangalore  |       14 |      48 |                   11 |               18 |
| Tumakuru   |        8 |      31 |                   10 |               16 |
| Hassan     |        5 |      19 |                    8 |               10 |
| Mangaluru  |        7 |      24 |                    9 |               17 |
| Udupi      |        6 |      18 |                    7 |               13 |
| Shivamogga |        7 |      22 |                    9 |               16 |
| Belgavi    |        6 |      16 |                    8 |               15 |
| Vijayapura |        5 |      10 |                    7 |               12 |
+------------+----------+---------+----------------------+------------------+

insert into route values
     (1,"Mysore","Bangalore",700,500,400,250),
     (2,"Shivamogga","Udupi",675,585,387,230),
     (3,"Mangaluru","Madikeri",NULL,400,320,270),
     (4,"Belgavi","Hubballi",1360,1100,980,840),
     (5,"Vijapura","Bangalore",1640,1060,895,743),
     (6,"Bangalore","Tumakuru",777,650,618,524),
     (7,"Tumakuru","Hassan",580,496,410,360),
     (8,"Udupi","Hassan",990,872,790,710),
     (9,"Hassan","Mysore",560,486,430,375);

 select *from route;
+----------+------------+-----------+------------+---------+-----------+--------+
| route_id | start      | finish    | ac_sleeper | sleeper | ac_seater | seater |
+----------+------------+-----------+------------+---------+-----------+--------+
|        1 | Mysore     | Bangalore |        700 |     500 |       400 |    250 |
|        2 | Shivamogga | Udupi     |        675 |     585 |       387 |    230 |
|        3 | Mangaluru  | Madikeri  |       NULL |     400 |       320 |    270 |
|        4 | Belgavi    | Hubballi  |       1360 |    1100 |       980 |    840 |
|        5 | Vijapura   | Bangalore |       1640 |    1060 |       895 |    743 |
|        6 | Bangalore  | Tumakuru  |        777 |     650 |       618 |    524 |
|        7 | Tumakuru   | Hassan    |        580 |     496 |       410 |    360 |
|        8 | Udupi      | Hassan    |        990 |     872 |       790 |    710 |
|        9 | Hassan     | Mysore    |        560 |     486 |       430 |    375 |
+----------+------------+-----------+------------+---------+-----------+--------+

   insert into schedule values
        (111,1311,3,"2023-12-02","2023-12-03"),
        (112,508,4,"2023-12-07","2023-12-07"),
        (113,1624,2,"2023-12-11","2023-12-11"),
        (114,4376,5,"2023-12-13","2023-12-14"),
        (115,4842,8,"2023-12-14","2023-12-15"),
        (116,5360,9,"2023-12-03","2023-12-03"),
        (117,7513,7,"2023-12-10","2023-12-11"),
        (118,508,1,"2023-12-09","2023-12-09");

select *from schedule;
+-------------+--------+------+------------+------------+
| schedule_id | bus_id | r_id | arrival    | departure  |
+-------------+--------+------+------------+------------+
|         111 |   1311 |    3 | 2023-12-02 | 2023-12-03 |
|         112 |    508 |    4 | 2023-12-07 | 2023-12-07 |
|         113 |   1624 |    2 | 2023-12-11 | 2023-12-11 |
|         114 |   4376 |    5 | 2023-12-13 | 2023-12-14 |
|         115 |   4842 |    8 | 2023-12-14 | 2023-12-15 |
|         116 |   5360 |    9 | 2023-12-03 | 2023-12-03 |
|         117 |   7513 |    7 | 2023-12-10 | 2023-12-11 |
|         118 |    508 |    1 | 2023-12-09 | 2023-12-09 |
+-------------+--------+------+------------+------------+


 insert into stop values
     (02,"AladaHali",2),
     (03,"Bengooru",3),
     (04,"Timmasagar",4),
     (05,"Kormangala",5),
     (06,"Hosalli",6),
     (07,"Alur",7),
     (08,"Arasikere",8),
     (09,"Gokulam",9);

 select *from stop;
+-------------+---------------+----------+
| location_id | location_name | route_id |
+-------------+---------------+----------+
|           1 | Jayanagar     |        1 |
|           2 | AladaHali     |        2 |
|           3 | Bengooru      |        3 |
|           4 | Timmasagar    |        4 |
|           5 | Kormangala    |        5 |
|           6 | Hosalli       |        6 |
|           7 | Alur          |        7 |
|           8 | Arasikere     |        8 |
|           9 | Gokulam       |        9 |
+-------------+---------------+----------+

 insert into payment values
     (1,2,675,"2023-12-02","Online"),
     (2,3,1060,"2023-11-29","Online"),
     (3,1,710,"2023-12-02","Cash"),
     (4,7,872,"2023-12-14","Online"),
     (5,5,1100,"2023-12-13","Cash"),
     (6,9,486,"2023-11-30","Cash"),
     (7,10,400,"2023-12-15","online"),
     (8,4,1060,"2023-11-21","Online"),
     (9,6,1100,"2023-12-01","Cash");

select *from payment;
+------------+--------------+--------+--------------+----------------+
| payment_id | passenger_id | amount | payment_date | payment_method |
+------------+--------------+--------+--------------+----------------+
|          1 |            2 |    675 | 2023-12-02   | Online         |
|          2 |            3 |   1060 | 2023-11-29   | Online         |
|          3 |            1 |    710 | 2023-12-02   | Cash           |
|          4 |            7 |    872 | 2023-12-14   | Online         |
|          5 |            5 |   1100 | 2023-12-13   | Cash           |
|          6 |            9 |    486 | 2023-11-30   | Cash           |
|          7 |           10 |    400 | 2023-12-15   | online         |
|          8 |            4 |   1060 | 2023-11-21   | Online         |
|          9 |            6 |   1100 | 2023-12-01   | Cash           |
+------------+--------------+--------+--------------+----------------+


insert into booking values
     (001,2,111,21,"2023-12-02",1),
     (002,3,116,26,"2023-11-09",2),
     (003,1,117,32,"2023-12-02",3),
     (004,7,112,14,"2023-12-14",4),
     (005,5,114,04,"2023-12-13",5),
     (006,9,112,08,"2023-11-30",6),
     (007,10,118,11,"2023-12-15",7),
     (008,4,111,27,"2023-11-21",8),
     (009,6,115,03,"2023-12-01",9);

select *from booking;
+------------+--------------+-------------+-------------+--------------+------------+
| booking_id | passenger_id | schedule_id | seat_number | booking_date | payment_id |
+------------+--------------+-------------+-------------+--------------+------------+
|          1 |            2 |         111 |          21 | 2023-12-02   |          1 |
|          2 |            3 |         116 |          26 | 2023-11-09   |          2 |
|          3 |            1 |         117 |          32 | 2023-12-02   |          3 |
|          4 |            7 |         112 |          14 | 2023-12-14   |          4 |
|          5 |            5 |         114 |           4 | 2023-12-13   |          5 |
|          6 |            9 |         112 |           8 | 2023-11-30   |          6 |
|          7 |           10 |         118 |          11 | 2023-12-15   |          7 |
|          8 |            4 |         111 |          27 | 2023-11-21   |          8 |
|          9 |            6 |         115 |           3 | 2023-12-01   |          9 |
+------------+--------------+-------------+-------------+--------------+------------+

--Queries
-- Query 1:Retrieve passengers older than 30 with their booking details
SELECT p.id, p.fname, p.lname, p.age, b.booking_id, b.schedule_id, b.seat_number
FROM passengers p
JOIN booking b ON p.id = b.passenger_id
WHERE p.age > 30;
+----+---------+-----------+-----+------------+-------------+-------------+
| id | fname   | lname     | age | booking_id | schedule_id | seat_number |
+----+---------+-----------+-----+------------+-------------+-------------+
|  1 | Mala    | G.S       |  46 |          3 |         117 |          32 |
|  4 | Chaitra | Ishwar    |  28 |          8 |         111 |          27 |
|  5 | Deepa   | S.R       |  32 |          5 |         114 |           4 |
| 10 | Ganavi  | Jagadeesha |  63 |          7 |         118 |          11 |
+----+---------+-----------+-----+------------+-------------+-------------+

-- Query 2:Find bus routes with AC seater capacity greater than 500 and ordered by route ID
SELECT * FROM route WHERE ac_seater > 500 ORDER BY route_id;
+----------+------------+-----------+------------+---------+-----------+--------+
| route_id | start      | finish    | ac_sleeper | sleeper | ac_seater | seater |
+----------+------------+-----------+------------+---------+-----------+--------+
|        1 | Mysore     | Bangalore |        700 |     500 |       400 |    250 |
|        5 | Vijapura   | Bangalore |       1640 |    1060 |       895 |    743 |
|        6 | Bangalore  | Tumakuru  |        777 |     650 |       618 |    524 |
+----------+------------+-----------+------------+---------+-----------+--------+
     
--  Query 3:Display passengers who made payments online along with their payment details

SELECT p.fname, p.lname, pa.amount, pa.payment_date, pa.payment_method
FROM passengers p
JOIN payment pa ON p.id = pa.passenger_id
WHERE pa.payment_method LIKE '%Online%';
+---------+-----------+--------+--------------+----------------+
| fname   | lname     | amount | payment_date | payment_method |
+---------+-----------+--------+--------------+----------------+
| Mala    | G.S       |    710 | 2023-12-02   | Cash           |
| Sanjana | N         |   1060 | 2023-11-29   | Online         |
| Namitha | Kadam     |    400 | 2023-12-15   | online         |
| Rohan   | Bharadwaj |   1060 | 2023-11-21   | Online         |
+---------+-----------+--------+--------------+----------------+

--  Query 4:Get the total count of employees in each city
SELECT city, branches + drivers + administrative_staff + maintenance_crew AS total_employees
FROM employee;
+------------+-----------------+
| city       | total_employees |
+------------+-----------------+
| Mysore     |              42 |
| Bangalore  |              91 |
| Tumakuru   |              65 |
| Hassan     |              42 |
| Mangaluru  |              57 |
| Udupi      |              44 |
| Shivamogga |              54 |
| Belgavi    |              45 |
| Vijayapura |              34 |
+------------+-----------------+
     
-- Query 5: Retrieve bookings made after '2023-12-01' along with their schedule details
SELECT b.booking_id, b.passenger_id, b.booking_date, s.arrival, s.departure
FROM booking b
JOIN schedule s ON b.schedule_id = s.schedule_id
WHERE b.booking_date > '2023-12-01';
+------------+--------------+--------------+------------+------------+
| booking_id | passenger_id | booking_date | arrival    | departure  |
+------------+--------------+--------------+------------+------------+
|          7 |           10 | 2023-12-15   | 2023-12-09 | 2023-12-09 |
|          9 |            6 | 2023-12-01   | 2023-12-03 | 2023-12-03 |
+------------+--------------+--------------+------------+------------+

--  Query 6:Find passengers who booked seats on buses rated above 9 and display their details
SELECT p.id, p.fname, p.lname, b.bus_name, b.rating
FROM passengers p
JOIN booking bk ON p.id = bk.passenger_id
JOIN schedule s ON bk.schedule_id = s.schedule_id
JOIN bus b ON s.bus_id = b.bus_id
WHERE b.rating > 9;
+----+---------+-----------+------------+--------+
| id | fname   | lname     | bus_name   | rating |
+----+---------+-----------+------------+--------+
|  1 | Mala    | G.S       | Hiravata   |    9.6 |
|  2 | Lakshmi | K.M       | BharatBenz |    9.8 |
|  4 | Chaitra | Ishwar    | Hiravata   |    9.6 |
+----+---------+-----------+------------+--------+
     
--  Query 7:Count the number of passengers per bus type:
SELECT bus_type, COUNT(*) AS passenger_count
FROM passenger_bus_info
GROUP BY bus_type;
+------------+------------------+
| bus_type   | passenger_count |
+------------+------------------+
| 1decker    | 2                |
| 1decker_AC | 1                |
| 2decker    | 2                |
| 2decker_AC | 2                |
| AC         | 3                |
+------------+------------------+

--  Query 8:Find the passengers who traveled on 2023-12-02:
SELECT fname, lname
FROM passenger_bus_info
WHERE id IN (
    SELECT id
    FROM schedule
    WHERE travel_date = '2023-12-02'
);
+-------+-----------+
| fname | lname     |
+-------+-----------+
| Mala  | G.S       |
| Chaitra | Ishwar  |
+------ -+-----------+

--  Query 9:Retrieve passengers full names and the buses they traveled on, sorted by bus type in ascending order:
SELECT CONCAT(fname, ' ', lname) AS full_name, bus_name, bus_type
FROM passenger_bus_info
ORDER BY bus_type ASC;
+--------------+------------+------------+
| full_name    | bus_name   | bus_type   |
+--------------+------------+------------+
| Mala G.S     | Hiravata   | AC         |
| Chaitra Ishwar | Hiravata   | AC         |
| Sanjana N    | AshokVK    | 2decker    |
| Lakshmi K.M  | BharatBenz | 2decker_AC |
| Namitha Kadam | Cruzio     | AC         |
| Gowri Holla  | Sweaty     | 1decker    |
| Vaishnavi T.M | RajExpress | 2decker    |
| Namitha Kadam | Hiravata   | AC         |
+--------------+------------+------------+
     
-- Query 10:Display the passengers who traveled on a 2-decker bus:
SELECT fname, lname
FROM passenger_bus_info
WHERE bus_type LIKE '%2decker%';
+--------------+-----------+
| fname        | lname     |
+--------------+-----------+
| Sanjana      | N         |
| Lakshmi      | K.M       |
| Vaishnavi    | T.M       |
+--------------+-----------+

--  Query 11:Find the most frequently traveled bus name:
SELECT bus_name, COUNT(*) AS total_travels
FROM passenger_bus_info
GROUP BY bus_name
ORDER BY total_travels DESC
LIMIT 1;
+------------+--------------+
| bus_name   | total_travels |
+------------+--------------+
| Hiravata   | 3            |
+------------+--------------+

--  Query 12:Identify passengers who traveled on 'RajExpress' bus:
SELECT fname, lname
FROM passenger_bus_info
WHERE bus_name = 'RajExpress';
+---------+----------+
| fname   | lname    |
+---------+----------+
| Vaishnavi | T.M     |
+---------+----------+

Views:
1. View to show detailed booking information:
sql
CREATE VIEW vw_booking_details AS
SELECT
    b.booking_id,
    p.fname,
    p.lname,
    s.departure,
    s.arrival,
    b.seat_number
FROM booking b
JOIN passengers p ON b.passenger_id = p.id
JOIN schedule s ON b.schedule_id = s.schedule_id;
SELECT * FROM vw_booking_details;
+------------+-----------+-----------+------------+------------+-------------+
| booking_id | fname     | lname     | departure  | arrival    | seat_number |
+------------+-----------+-----------+------------+------------+-------------+
| 1          | Mala      | G.S       | 2023-12-03 | 2023-12-02 | 21          |
| 2          | Sanjana   | N         | 2023-12-03 | 2023-12-03 | 26          |
| 3          | Chaitra   | Ishwar    | 2023-12-11 | 2023-12-10 | 32          |
| 4          | Gowri     | Holla     | 2023-12-07 | 2023-12-07 | 14          |
| 5          | Deepa     | S.R       | 2023-12-14 | 2023-12-13 | 4           |
| 6          | Namitha   | Kadam     | 2023-12-11 | 2023-12-10 | 8           |
| 7          | Ganavi    | Jagadeesha | 2023-12-09 | 2023-12-09 | 11          |
| 8          | Rohan     | Bharadwaj | 2023-12-15 | 2023-12-14 | 27          |
| 9          | Vaishnavi | T.M       | 2023-12-14 | 2023-12-13 | 3           |
+------------+-----------+-----------+------------+------------+-------------+
2. View to display bus details with its driver:
sql
CREATE VIEW vw_bus_driver AS
SELECT
    b.bus_id,
    b.bus_name,
    d.d_name AS driver_name
FROM bus b
JOIN driver d ON b.driver_id = d.d_id;
SELECT * FROM vw_bus_driver;
+--------+------------+-------------+
| bus_id | bus_name   | driver_name |
+--------+------------+-------------+
| 508    | Hiravata   | Vikram      |
| 1311   | AshokVK    | Kumara      |
| 1624   | BharatBenz | Vikram      |
| 4376   | Mahindra   | Mahesha     |
| 4842   | RajExpress | Rudra       |
| 5360   | Cruzio     | Mahesha     |
| 7513   | Sweaty     | Raju        |
+--------+------------+-------------+

3. View to passanger info with bus :
sql
CREATE VIEW passenger_bus_info AS SELECT p.id, p.fname, p.lname, b.bus_name, b.bus_type FROM passengers p JOIN schedule s ON p.id = s.r_id JOIN bus b ON s.bus_id = b.bus_id;
 
select *from passenger_bus_info;
+----+---------+-----------+------------+------------+
| id | fname   | lname     | bus_name   | bus_type   |
+----+---------+-----------+------------+------------+
|  4 | Chaitra | Ishwar    | Hiravata   | AC         |
|  1 | Mala    | G.S       | Hiravata   | AC         |
|  3 | Sanjana | N         | AshokVK    | 2decker    |
|  2 | Lakshmi | K.M       | BharatBenz | 2decker_AC |
|  5 | Deepa   | S.R       | Mahindra   | 1decker_AC |
|  8 | Rohan   | Bharadwaj | RajExpress | 2decker    |
|  9 | Namitha | Kadam     | Cruzio     | AC         |
|  7 | Gowri   | Holla     | Sweaty     | 1decker    |
+----+---------+-----------+------------+------------+

