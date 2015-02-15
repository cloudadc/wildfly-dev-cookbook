
create table airport (
        airportid integer not null auto_increment,
        airportcode varchar(3) not null,
        airportname varchar(50) not null,
        city varchar(50) not null,
        country varchar(3) not null,
        latitude decimal(18,15),
        longitude decimal(18,15),
        state_prov varchar(25),
        primary key (airportid)
);

create table flight (
        flightid integer not null auto_increment,
        arrivaldate datetime not null,
        departuredate datetime not null,
        firstclassprice decimal(10,2),
        flightnumber integer not null,
        price decimal(10,2) not null,
        seatstaken integer not null,
        planeid integer not null,
        routeid integer not null,
        primary key (flightid)
);

create table plane (
        planeid integer not null auto_increment,
        planemodel varchar(35) not null,
        tailnumber varchar(15) not null,
        totalnumberofseats integer not null,
        primary key (planeid)
);

create table reservation (
        reservationid integer not null auto_increment,
        checkedin integer not null,
        comment longtext,
        flightid integer not null,
        seatid integer not null,
        userid integer not null,
        meal varchar(20),
        primary key (reservationid)
);

create table route (
        routeid integer not null auto_increment,
        distance integer not null,
        destinationairportid integer not null,
        originairportid integer not null,
        primary key (routeid)
);

create table seat (
        seatid integer not null auto_increment,
        seatname varchar(4) not null,
        planeid integer not null,
        seatcategory varchar(10) not null,
        seatposition varchar(10) not null,
        primary key (seatid)
);

create table user (
        userid integer not null auto_increment,
        address1 varchar(35) not null,
        address2 varchar(35),
        age integer,
        alan_resorts_id varchar(10),
        city varchar(25) not null,
        country varchar(3) not null,
        d_hotels_id varchar(10),
        emailaddress varchar(50) not null,
        firstname varchar(35) not null,
        frequentflyernumber integer,
        lastname varchar(35) not null,
        loyaltylevel varchar(10),
        middlename varchar(35),
        password varchar(250) not null,
        phonenumber integer,
        state_prov varchar(2) not null,
        username varchar(35) not null,
        zip_post varchar(10) not null,
        primary key (userid)
);

create table role (
	roleid integer not null auto_increment,
	userid integer not null,
	rolename varchar(25) not null,
	primary key (roleid)
);

create table val_mealtype (
        meal varchar(20) not null,
        primary key (meal)
);

create table val_seatclass (
        class varchar(10) not null,
        primary key (class)
);

create table val_seattype (
        seatposition varchar(10) not null,
        primary key (seatposition)
);

create table val_billingtype (
        billingprovider varchar(20) not null,
        primary key (billingprovider)
);


alter table flight add constraint fk_flight_to_plane foreign key (planeid) references plane (planeid);

alter table flight add constraint fk_flight_to_route foreign key (routeid) references route (routeid);

alter table reservation add constraint fk_reservation_to_flight foreign key (flightid) references flight (flightid);

alter table reservation add constraint fk_reservation_to_seat foreign key (seatid) references seat (seatid);

alter table reservation add constraint fk_reservation_to_user foreign key (userid) references user (userid);

alter table reservation add constraint fk_reservation_to_val_mealtype foreign key (meal) references val_mealtype (meal);

alter table route add constraint fk_route_to_airport foreign key (destinationairportid) references airport (airportid);

alter table route add constraint fk_route_to_airport_ori foreign key (originairportid) references airport (airportid);

alter table seat add constraint fk_seat_to_plane foreign key (planeid) references plane (planeid);

alter table seat add constraint fk_seat_to_val_seatclass foreign key (seatcategory) references val_seatclass (class);

alter table seat add constraint fk_seat_to_val_seattype foreign key (seatposition) references val_seattype (seatposition);

alter table role add constraint fk_role_to_user foreign key (userid) references user (userid);


INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('William', 'Howard', '', 'kylin', 'jboss', 'whow@globochem.com', 2147483647, 'Ap #665-939 Iaculis Road', null, 'Pembroke', 'NC', '48719', 'USA', 733790836, null, null, 18, 'None');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Sterling', 'Archer', 'M', 'duchess', 'jboss', 'imawesome@isis.gov', 2147483647, 'Ap #197-361 Quis, St.', null, 'New York', 'NY', '28017', 'USA', 453883790, 'XY32612', null, 19, 'Silver');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Kara', 'Thrace', '', 'starbuck', 'jboss', 'starbuck@galactica.com', 2147483647, 'P.O. Box 601, 6936 Nulla. Avenue', null, 'Caprica City', 'DC', '51101', 'USA', 141252654, null, 'QZRT1262', 20, 'Bronze');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Buffy', 'Summers', '', 'chosen1', 'jboss', 'theslayer@sunnydale.org', 2147483647, '622-6400 Ac Rd.', null, 'Sunnydale', 'CA', '44195', 'USA', 743177622, null, null, 21, 'Gold');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Henry', 'Venture', 'Allen', 'hankinator', 'jboss', 'hankinator@venture.com', 2147483647, 'Ap #958-968 Sollicitudin Rd.', null, 'Falls Church', 'MI', '14090', 'USA', 765360316, 'XY161512', 'QZRT1645', 23, 'Gold');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Byron', 'Orpheus', '', 'doctor_o', 'jboss', 'dr_o@necromancy.org', 2147483647, '751-3994 Phasellus Road', null, 'Port Arthur', 'IL', '60905', 'USA', 318901745, null, 'QZRT7623', 56, 'Bronze');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Malcolm', 'Reynolds', '', 'capt_mal', 'jboss', 'browncoat@serenity.com', 2147483647, 'Ap #279-6041 Cursus St.', null, 'El Paso', 'TN', '35325', 'USA', 890397493, null, null, 43, 'Silver');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Lana', 'Kane', '', 'yyyup', 'jboss', 'yyyup@isis.gov', 2147483647, '778-5301 Vel St.', null, 'Salem', 'TX', '79883', 'USA', 723175779, null, null, 16, 'None');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Peter', 'Lafleur', '', 'avg_joe', 'jboss', 'peter@avgjoe.com', 2147483647, '9638 Nibh. Rd.', null, 'Springfield', 'SC', '60634', 'USA', 160896801, null, null, 38, 'Gold');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Cyril', 'Figgus', '', 'stirfryday', 'jboss', 'comptrol@isis.gov', 2147483647, 'Ap #552-454 Sagittis. Rd.', null, 'Dubuque', 'NE', '86987', 'USA', 273724890, null, null, 44, 'Bronze');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Motoko', 'Kusanagi', '', 'the_major', 'jboss', 'major@section9.org', 2147483647, '6108 Sed Av.', null, 'Layton', 'WV', '79742', 'USA', 531722590, null, null, 20, 'Gold');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Chloe', 'Sullivan', 'Elizabeth', 'watchtower', 'jboss', 'watchtower@jla.org', 2147483647, 'Ap #571-372 Facilisis Ave', null, 'Metropolis', 'KA', '77002', 'USA', 409787762, null, null, 49, 'None');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Hunter', 'Gathers', '', 'goodintel', 'jboss', 'gathers@osi.gov', 2147483647, 'P.O. Box 803, 3482 Tortor, St.', null, 'Benton Harbor', 'WV', '24975', 'USA', 671710421, null, null, 37, 'Gold');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Hal', 'Jordan', '', 'lantern', 'jboss', 'gl@jla.org', 2147483647, 'Ap #303-6363 Nec St.', null, 'Agoura Hills', 'MS', '71975', 'USA', 665821336, null, null, 44, 'Silver');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Edward', 'Elrich', '', 'fullmetal', 'jboss', 'fullmetal@alchemy.org', 2147483647, 'P.O. Box 574, 2495 In Ave', null, 'Bowie', 'MS', '53677', 'USA', 190152924, null, null, 76, 'Bronze');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Sheldon', 'Cooper', 'L', 'iq187', 'jboss', 'moonpie@caltech.edu', 2147483647, '1792 Nisi Street', null, 'Williston', 'TX', '86543', 'USA', 567956309, null, null, 17, 'Bronze');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Tony', 'Stark', '', 'ironman', 'jboss', 'stark@starkindustries.com', 2147483647, 'Ap #239-4239 Massa St.', null, 'San Fernando', 'NH', '99199', 'USA', 973715422, null, null, 87, 'Gold');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Conway', 'Stern', '', 'smooth', 'jboss', 'smooth@isis.gov', 2147483647, 'P.O. Box 237, 6408 In Ave', null, 'Milwaukee', 'KS', '15172', 'USA', 163332504, null, null, 14, 'Gold');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Beatrix', 'Kiddo', '', 'bride', 'jboss', 'blackmamba@viper.com', 2147483647, '8823 Vel, Street', null, 'Lubbock', 'NV', '14784', 'USA', 875873496, null, null, 32, 'Bronze');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('Jay', 'Boss', 'A.', 'student', 'jboss', 'student@jbtraining.com', 2147483647, 'P.O. BOX 13588', null, 'Raleigh', 'NC', '27713', 'USA', 123456789, null, null, 21, 'Bronze');
INSERT INTO user(firstname, lastname, middlename, username, password, emailaddress, phonenumber, address1, address2, city, state_prov, zip_post, country, frequentflyernumber, d_hotels_id, alan_resorts_id, age, loyaltylevel) VALUES ('admin', 'admin', '', 'admin', 'admin', 'admin@jbtraining.com', 2147483647, 'P.O. BOX 13588', null, 'Raleigh', 'NC', '27713', 'USA', 123456789, null, null, 99, 'Gold');


INSERT INTO role(userid, rolename) VALUES(1, 'PAYLVL1');
INSERT INTO role(userid, rolename) VALUES(2, 'PAYLVL2');


INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Phoenix Sky Harbor International Airport', 'PHX', 'Phoenix', 'AZ', 'USA',-112.03333333333,33.433333333333 );
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('San Francisco International Airport', 'SFO', 'San Francisco', 'CA', 'USA',37.6189722,-122.3748889 );
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Denver International Airport', 'DEN', 'Denver', 'CO', 'USA', -104.67305555556,39.861666666667);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Miami International Airport', 'MIA', 'Miami', 'FL', 'USA', -80.266666666667,25.783333333333);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Hartsfield-Jackson Atlanta International Airport', 'ATL', 'Atlanta', 'GA', 'USA', -84.428055555556,33.636666666667);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Chicago O''Hare International Airport', 'ORD', 'Chicago', 'IL', 'USA', -87.904722222222,41.978611111111);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Gen. Edward Lawrence Logan International Airport', 'BOS', 'Boston', 'MA', 'USA', 42.363055555556,-71);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Manchester-Boston Regional Airport', 'MHT', 'Manchester', 'NH', 'USA',42.9325,-71.435555555556 );
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Newark Liberty International Airport', 'EWR', 'Newark', 'NJ', 'USA',40.6925,-74.168611111111);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('John F. Kennedy International Airport', 'JFK', 'New York', 'NY', 'USA',40.633333333333,-73.783333333333);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('LaGuardia Airport (also see Marine Air Terminal)', 'LGA', 'New York', 'NY', 'USA',40.766666666667,-73.866666666667);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Charlotte/Douglas International Airport', 'CLT', 'Charlotte', 'NC', 'USA',35.216666666667,-80.933333333333);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Raleigh-Durham International Airport', 'RDU', 'Raleigh', 'NC', 'USA',35.877777777778,-78.7875);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Austin-Bergstrom International Airport', 'AUS', 'Austin', 'TX', 'USA', 30.194444444444,-97.67);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Dallas-Fort Worth International Airport', 'DFW', 'Dallas-Fort Worth', 'TX', 'USA', 32.896944444444, -97.038055555556);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Washington Dulles International Airport', 'IAD', 'Washington, D.C. (Chantilly / Dulles) ', 'DC', 'USA',38.944444444444,-77.455833333333);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Heathrow International Airport', 'LHR', 'London ', 'Hillington', 'GB',51.469722222222,-0.45138888888889);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Franz Joseph Strauss Airport', 'MUC', 'Munich ', 'München', 'DE', 48.35, 11.783333333333);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Charles De Gaulle International Airport', 'CDG', 'Paris', '', 'FR', 2.5477777777778, 49.009722222222);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Arlanda Airport', 'ARN', 'Stockholm', '', 'SE',59.651944444444, 17.918611111111);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Barajas Airport', 'MAD', 'Madrid', '', 'ES',40.466666666667,-3.5666666666667);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Brisbane International Airport', 'BNE', 'Brisbane', 'Queensland', 'AU',-27.383333333333,153.11666666667);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Changi Airport', 'SIN', 'Singapore', '', 'SG',1.3502777777778,103.99444444444);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Jorge Newbery Airport', 'AEP', 'Buenos Aires', '', 'AR',-34.559166666667,-58.415555555556);
INSERT INTO airport(airportname, airportcode, city, state_prov, country, latitude, longitude) VALUES ('Lester B. Pearson International Airport', 'YYZ', 'Toronto', 'Ontario', 'CA',43.677222222222,-79.630555555556);


INSERT INTO plane(planemodel, totalnumberofseats, tailnumber) VALUES ('Aerospatiale/Alenia 72', 66, 'N6907C');
INSERT INTO plane(planemodel, totalnumberofseats, tailnumber) VALUES ('Boeing 737', 148, 'N62AF');
INSERT INTO plane(planemodel, totalnumberofseats, tailnumber) VALUES ('Embraer ERJ-170', 76, 'N603BL');
INSERT INTO plane(planemodel, totalnumberofseats, tailnumber) VALUES ('Embraer ERJ-190', 100, 'N620D');


INSERT INTO route(originairportid, destinationairportid, distance) VALUES (10, 2, 2593);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (7, 13, 615);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (11, 18, 3459);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (5, 9, 749);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (19, 24, 6283);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (5, 25, 5030);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (16, 5, 734);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (2, 23, 7106);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (2, 24, 8483);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (18, 19, 588);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (18, 21, 913);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (20, 22, 605);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (18, 23, 10333);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (2, 10, 2593);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (13, 7, 615);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (18, 11, 3459);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (24, 19, 6283);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (25, 5, 5030);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (23, 2, 7106);
INSERT INTO route(originairportid, destinationairportid, distance) VALUES (19, 18, 588);


INSERT INTO  val_billingtype (billingprovider) VALUES ('Visa');
INSERT INTO  val_billingtype (billingprovider) VALUES ('Discover');
INSERT INTO  val_billingtype (billingprovider) VALUES ('AMEX');
INSERT INTO  val_billingtype (billingprovider) VALUES ('MasterCard');

INSERT INTO val_mealtype (meal) VALUES ('None');
INSERT INTO val_mealtype (meal) VALUES ('No Preference');
INSERT INTO val_mealtype (meal) VALUES ('Chicken');
INSERT INTO val_mealtype (meal) VALUES ('Vegetarian');
INSERT INTO val_mealtype (meal) VALUES ('Kosher');

INSERT INTO val_seattype (seatposition) VALUES ('None');
INSERT INTO val_seattype (seatposition) VALUES ('Window');
INSERT INTO val_seattype (seatposition) VALUES ('Aisle');
INSERT INTO val_seattype (seatposition) VALUES ('Row');

INSERT INTO val_seatclass (class) VALUES ('First');
INSERT INTO val_seatclass (class) VALUES ('Economy');


INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '2A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '2B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '2C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '2D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '3A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '3B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '3C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '3D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '4A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '4B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '4C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '4D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '5A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '5B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '5C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '5D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '6A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '6B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '6C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '6D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '7A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '7B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '7C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '7D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '8A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '8B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '8C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '8D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '9A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '9B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '9C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '9D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '10A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '10B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '10C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '10D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '11A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '11B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '11C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '11D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '12A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '12B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '12C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '12D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '13A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '13B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '13C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '13D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '14A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '14B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '14C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '14D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '15A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '15B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '15C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '15D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '16A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '16B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '16C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '16D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '17A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (1, '17B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '3A', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '3B', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '3E', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '3F', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '4A', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '4B', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '4E', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '4F', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '5A', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '5B', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '5E', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '5F', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '6A', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '6B', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '6E', 'Aisle', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '6F', 'Window', 'First');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '7A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '7B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '7C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '7D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '7E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '7F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '8A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '8B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '8C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '8D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '8E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '8F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '9A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '9B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '9C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '9D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '9E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '9F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '10A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '10B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '10C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '10D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '10E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '10F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '11A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '11B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '11C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '11D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '11E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '11F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '12A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '12B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '12C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '12D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '12E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '12F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '13A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '13B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '13C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '13D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '13E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '13F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '14A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '14B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '14C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '14D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '14E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '14F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '15A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '15B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '15C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '15D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '15E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '15F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '16A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '16B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '16C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '16D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '16E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '16F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '17A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '17B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '17C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '17D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '17E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '17F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '18A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '18B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '18C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '18D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '18E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '18F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '19A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '19B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '19C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '19D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '19E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '19F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '20A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '20B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '20C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '20D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '20E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '20F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '21A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '21B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '21C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '21D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '21E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '21F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '22A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '22B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '22C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '22D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '22E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '22F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '23A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '23B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '23C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '23D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '23E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '23F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '24A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '24B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '24C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '24D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '24E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '24F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '25A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '25B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '25C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '25D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '25E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '25F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '26A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '26B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '26C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '26D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '26E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '26F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '27A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '27B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '27C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '27D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '27E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '27F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '28A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '28B', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '28C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '28D', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '28E', 'Row', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (2, '28F', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '1A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '1B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '1C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '1D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '2A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '2B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '2C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '2D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '3A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '3B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '3C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '3D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '4A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '4B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '4C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '4D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '5A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '5B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '5C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '5D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '6A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '6B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '6C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '6D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '7A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '7B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '7C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '7D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '8A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '8B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '8C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '8D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '9A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '9B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '9C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '9D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '10A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '10B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '10C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '10D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '11A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '11B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '11C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '11D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '12A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '12B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '12C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '12D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '13A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '13B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '13C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '13D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '14A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '14B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '14C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '14D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '15A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '15B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '15C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '15D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '16A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '16B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '16C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '16D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '17A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '17B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '17C', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '17D', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '18A', 'Window', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '18B', 'Aisle', 'Economy');
INSERT INTO seat(planeid, seatname, seatposition, seatcategory) VALUES (3, '18C', 'Aisle', 'Economy');


INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-06-27 06:00:00.0', '2014-06-27 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-06-27 19:33:00.0', '2014-06-28 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-06-28 10:31:00.0', '2014-06-28 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-06-29 00:04:00.0', '2014-06-29 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-06-29 15:02:00.0', '2014-06-30 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-06-30 04:35:00.0', '2014-06-30 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-01 06:00:00.0', '2014-07-01 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-01 19:33:00.0', '2014-07-02 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-02 10:31:00.0', '2014-07-02 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-03 00:04:00.0', '2014-07-03 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-03 15:02:00.0', '2014-07-04 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-04 04:35:00.0', '2014-07-04 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-05 06:00:00.0', '2014-07-05 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-05 19:33:00.0', '2014-07-06 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-06 10:31:00.0', '2014-07-06 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-07 00:04:00.0', '2014-07-07 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-07 15:02:00.0', '2014-07-08 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-08 04:35:00.0', '2014-07-08 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-09 06:00:00.0', '2014-07-09 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-09 19:33:00.0', '2014-07-10 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-10 10:31:00.0', '2014-07-10 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-11 00:04:00.0', '2014-07-11 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-11 15:02:00.0', '2014-07-12 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-12 04:35:00.0', '2014-07-12 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-13 06:00:00.0', '2014-07-13 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-13 19:33:00.0', '2014-07-14 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-14 10:31:00.0', '2014-07-14 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-15 00:04:00.0', '2014-07-15 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-15 15:02:00.0', '2014-07-16 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-16 04:35:00.0', '2014-07-16 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-17 06:00:00.0', '2014-07-17 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-17 19:33:00.0', '2014-07-18 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-18 10:31:00.0', '2014-07-18 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-19 00:04:00.0', '2014-07-19 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-19 15:02:00.0', '2014-07-20 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-20 04:35:00.0', '2014-07-20 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-21 06:00:00.0', '2014-07-21 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-21 19:33:00.0', '2014-07-22 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-22 10:31:00.0', '2014-07-22 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-23 00:04:00.0', '2014-07-23 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-23 15:02:00.0', '2014-07-24 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-24 04:35:00.0', '2014-07-24 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-25 06:00:00.0', '2014-07-25 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-25 19:33:00.0', '2014-07-26 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-26 10:31:00.0', '2014-07-26 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-27 00:04:00.0', '2014-07-27 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-27 15:02:00.0', '2014-07-28 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-28 04:35:00.0', '2014-07-28 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-29 06:00:00.0', '2014-07-29 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-29 19:33:00.0', '2014-07-30 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-30 10:31:00.0', '2014-07-30 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-07-31 00:04:00.0', '2014-07-31 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-07-31 15:02:00.0', '2014-08-01 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-01 04:35:00.0', '2014-08-01 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-02 06:00:00.0', '2014-08-02 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-02 19:33:00.0', '2014-08-03 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-03 10:31:00.0', '2014-08-03 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-04 00:04:00.0', '2014-08-04 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-04 15:02:00.0', '2014-08-05 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-05 04:35:00.0', '2014-08-05 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-06 06:00:00.0', '2014-08-06 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-06 19:33:00.0', '2014-08-07 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-07 10:31:00.0', '2014-08-07 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-08 00:04:00.0', '2014-08-08 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-08 15:02:00.0', '2014-08-09 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-09 04:35:00.0', '2014-08-09 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-10 06:00:00.0', '2014-08-10 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-10 19:33:00.0', '2014-08-11 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-11 10:31:00.0', '2014-08-11 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-12 00:04:00.0', '2014-08-12 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-12 15:02:00.0', '2014-08-13 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-13 04:35:00.0', '2014-08-13 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-14 06:00:00.0', '2014-08-14 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-14 19:33:00.0', '2014-08-15 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-15 10:31:00.0', '2014-08-15 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-16 00:04:00.0', '2014-08-16 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-16 15:02:00.0', '2014-08-17 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-17 04:35:00.0', '2014-08-17 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-18 06:00:00.0', '2014-08-18 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-18 19:33:00.0', '2014-08-19 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-19 10:31:00.0', '2014-08-19 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-20 00:04:00.0', '2014-08-20 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-20 15:02:00.0', '2014-08-21 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-21 04:35:00.0', '2014-08-21 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-22 06:00:00.0', '2014-08-22 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-22 19:33:00.0', '2014-08-23 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-23 10:31:00.0', '2014-08-23 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-24 00:04:00.0', '2014-08-24 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-24 15:02:00.0', '2014-08-25 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-25 04:35:00.0', '2014-08-25 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-26 06:00:00.0', '2014-08-26 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-26 19:33:00.0', '2014-08-27 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-27 10:31:00.0', '2014-08-27 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-28 00:04:00.0', '2014-08-28 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-28 15:02:00.0', '2014-08-29 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-29 04:35:00.0', '2014-08-29 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-30 06:00:00.0', '2014-08-30 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-08-30 19:33:00.0', '2014-08-31 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-08-31 10:31:00.0', '2014-08-31 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-01 00:04:00.0', '2014-09-01 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-01 15:02:00.0', '2014-09-02 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-02 04:35:00.0', '2014-09-02 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-03 06:00:00.0', '2014-09-03 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-03 19:33:00.0', '2014-09-04 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-04 10:31:00.0', '2014-09-04 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-05 00:04:00.0', '2014-09-05 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-05 15:02:00.0', '2014-09-06 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-06 04:35:00.0', '2014-09-06 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-07 06:00:00.0', '2014-09-07 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-07 19:33:00.0', '2014-09-08 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-08 10:31:00.0', '2014-09-08 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-09 00:04:00.0', '2014-09-09 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-09 15:02:00.0', '2014-09-10 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-10 04:35:00.0', '2014-09-10 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-11 06:00:00.0', '2014-09-11 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-11 19:33:00.0', '2014-09-12 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-12 10:31:00.0', '2014-09-12 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-13 00:04:00.0', '2014-09-13 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-13 15:02:00.0', '2014-09-14 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-14 04:35:00.0', '2014-09-14 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-15 06:00:00.0', '2014-09-15 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-15 19:33:00.0', '2014-09-16 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-16 10:31:00.0', '2014-09-16 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-17 00:04:00.0', '2014-09-17 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-17 15:02:00.0', '2014-09-18 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-18 04:35:00.0', '2014-09-18 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-19 06:00:00.0', '2014-09-19 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-19 19:33:00.0', '2014-09-20 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-20 10:31:00.0', '2014-09-20 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-21 00:04:00.0', '2014-09-21 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-21 15:02:00.0', '2014-09-22 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-22 04:35:00.0', '2014-09-22 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-23 06:00:00.0', '2014-09-23 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-23 19:33:00.0', '2014-09-24 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-24 10:31:00.0', '2014-09-24 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-25 00:04:00.0', '2014-09-25 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-25 15:02:00.0', '2014-09-26 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-26 04:35:00.0', '2014-09-26 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-27 06:00:00.0', '2014-09-27 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-27 19:33:00.0', '2014-09-28 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-28 10:31:00.0', '2014-09-28 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-29 00:04:00.0', '2014-09-29 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-09-29 15:02:00.0', '2014-09-30 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-09-30 04:35:00.0', '2014-09-30 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-01 06:00:00.0', '2014-10-01 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-01 19:33:00.0', '2014-10-02 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-02 10:31:00.0', '2014-10-02 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-03 00:04:00.0', '2014-10-03 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-03 15:02:00.0', '2014-10-04 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-04 04:35:00.0', '2014-10-04 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-05 06:00:00.0', '2014-10-05 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-05 19:33:00.0', '2014-10-06 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-06 10:31:00.0', '2014-10-06 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-07 00:04:00.0', '2014-10-07 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-07 15:02:00.0', '2014-10-08 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-08 04:35:00.0', '2014-10-08 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-09 06:00:00.0', '2014-10-09 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-09 19:33:00.0', '2014-10-10 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-10 10:31:00.0', '2014-10-10 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-11 00:04:00.0', '2014-10-11 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-11 15:02:00.0', '2014-10-12 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-12 04:35:00.0', '2014-10-12 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-13 06:00:00.0', '2014-10-13 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-13 19:33:00.0', '2014-10-14 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-14 10:31:00.0', '2014-10-14 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-15 00:04:00.0', '2014-10-15 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-15 15:02:00.0', '2014-10-16 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-16 04:35:00.0', '2014-10-16 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-17 06:00:00.0', '2014-10-17 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-17 19:33:00.0', '2014-10-18 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-18 10:31:00.0', '2014-10-18 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-19 00:04:00.0', '2014-10-19 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-19 15:02:00.0', '2014-10-20 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-20 04:35:00.0', '2014-10-20 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-21 06:00:00.0', '2014-10-21 18:58:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-21 19:33:00.0', '2014-10-22 08:31:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-22 10:31:00.0', '2014-10-22 23:29:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-23 00:04:00.0', '2014-10-23 13:02:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (1, 1, 3368, '2014-10-23 15:02:00.0', '2014-10-24 04:00:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (14, 1, 3063, '2014-10-24 04:35:00.0', '2014-10-24 17:33:00.0', 0, 907.55, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-06-27 06:00:00.0', '2014-06-27 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-06-27 09:40:00.0', '2014-06-27 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-06-27 14:45:00.0', '2014-06-27 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-06-27 18:25:00.0', '2014-06-27 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-06-27 23:30:00.0', '2014-06-28 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-06-28 03:10:00.0', '2014-06-28 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-06-29 06:00:00.0', '2014-06-29 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-06-29 09:40:00.0', '2014-06-29 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-06-29 14:45:00.0', '2014-06-29 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-06-29 18:25:00.0', '2014-06-29 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-06-29 23:30:00.0', '2014-06-30 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-06-30 03:10:00.0', '2014-06-30 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-01 06:00:00.0', '2014-07-01 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-01 09:40:00.0', '2014-07-01 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-01 14:45:00.0', '2014-07-01 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-01 18:25:00.0', '2014-07-01 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-01 23:30:00.0', '2014-07-02 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-02 03:10:00.0', '2014-07-02 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-03 06:00:00.0', '2014-07-03 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-03 09:40:00.0', '2014-07-03 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-03 14:45:00.0', '2014-07-03 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-03 18:25:00.0', '2014-07-03 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-03 23:30:00.0', '2014-07-04 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-04 03:10:00.0', '2014-07-04 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-05 06:00:00.0', '2014-07-05 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-05 09:40:00.0', '2014-07-05 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-05 14:45:00.0', '2014-07-05 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-05 18:25:00.0', '2014-07-05 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-05 23:30:00.0', '2014-07-06 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-06 03:10:00.0', '2014-07-06 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-07 06:00:00.0', '2014-07-07 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-07 09:40:00.0', '2014-07-07 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-07 14:45:00.0', '2014-07-07 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-07 18:25:00.0', '2014-07-07 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-07 23:30:00.0', '2014-07-08 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-08 03:10:00.0', '2014-07-08 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-09 06:00:00.0', '2014-07-09 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-09 09:40:00.0', '2014-07-09 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-09 14:45:00.0', '2014-07-09 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-09 18:25:00.0', '2014-07-09 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-09 23:30:00.0', '2014-07-10 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-10 03:10:00.0', '2014-07-10 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-11 06:00:00.0', '2014-07-11 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-11 09:40:00.0', '2014-07-11 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-11 14:45:00.0', '2014-07-11 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-11 18:25:00.0', '2014-07-11 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-11 23:30:00.0', '2014-07-12 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-12 03:10:00.0', '2014-07-12 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-13 06:00:00.0', '2014-07-13 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-13 09:40:00.0', '2014-07-13 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-13 14:45:00.0', '2014-07-13 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-13 18:25:00.0', '2014-07-13 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-13 23:30:00.0', '2014-07-14 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-14 03:10:00.0', '2014-07-14 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-15 06:00:00.0', '2014-07-15 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-15 09:40:00.0', '2014-07-15 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-15 14:45:00.0', '2014-07-15 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-15 18:25:00.0', '2014-07-15 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-15 23:30:00.0', '2014-07-16 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-16 03:10:00.0', '2014-07-16 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-17 06:00:00.0', '2014-07-17 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-17 09:40:00.0', '2014-07-17 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-17 14:45:00.0', '2014-07-17 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-17 18:25:00.0', '2014-07-17 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-17 23:30:00.0', '2014-07-18 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-18 03:10:00.0', '2014-07-18 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-19 06:00:00.0', '2014-07-19 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-19 09:40:00.0', '2014-07-19 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-19 14:45:00.0', '2014-07-19 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-19 18:25:00.0', '2014-07-19 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-19 23:30:00.0', '2014-07-20 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-20 03:10:00.0', '2014-07-20 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-21 06:00:00.0', '2014-07-21 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-21 09:40:00.0', '2014-07-21 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-21 14:45:00.0', '2014-07-21 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-21 18:25:00.0', '2014-07-21 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-21 23:30:00.0', '2014-07-22 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-22 03:10:00.0', '2014-07-22 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-23 06:00:00.0', '2014-07-23 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-23 09:40:00.0', '2014-07-23 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-23 14:45:00.0', '2014-07-23 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-23 18:25:00.0', '2014-07-23 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-23 23:30:00.0', '2014-07-24 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-24 03:10:00.0', '2014-07-24 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-25 06:00:00.0', '2014-07-25 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-25 09:40:00.0', '2014-07-25 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-25 14:45:00.0', '2014-07-25 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-25 18:25:00.0', '2014-07-25 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-25 23:30:00.0', '2014-07-26 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-26 03:10:00.0', '2014-07-26 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-27 06:00:00.0', '2014-07-27 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-27 09:40:00.0', '2014-07-27 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-27 14:45:00.0', '2014-07-27 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-27 18:25:00.0', '2014-07-27 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-27 23:30:00.0', '2014-07-28 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-28 03:10:00.0', '2014-07-28 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-29 06:00:00.0', '2014-07-29 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-29 09:40:00.0', '2014-07-29 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-29 14:45:00.0', '2014-07-29 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-29 18:25:00.0', '2014-07-29 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-29 23:30:00.0', '2014-07-30 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-30 03:10:00.0', '2014-07-30 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-31 06:00:00.0', '2014-07-31 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-31 09:40:00.0', '2014-07-31 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-31 14:45:00.0', '2014-07-31 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-07-31 18:25:00.0', '2014-07-31 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-07-31 23:30:00.0', '2014-08-01 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-01 03:10:00.0', '2014-08-01 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-02 06:00:00.0', '2014-08-02 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-02 09:40:00.0', '2014-08-02 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-02 14:45:00.0', '2014-08-02 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-02 18:25:00.0', '2014-08-02 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-02 23:30:00.0', '2014-08-03 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-03 03:10:00.0', '2014-08-03 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-04 06:00:00.0', '2014-08-04 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-04 09:40:00.0', '2014-08-04 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-04 14:45:00.0', '2014-08-04 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-04 18:25:00.0', '2014-08-04 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-04 23:30:00.0', '2014-08-05 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-05 03:10:00.0', '2014-08-05 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-06 06:00:00.0', '2014-08-06 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-06 09:40:00.0', '2014-08-06 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-06 14:45:00.0', '2014-08-06 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-06 18:25:00.0', '2014-08-06 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-06 23:30:00.0', '2014-08-07 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-07 03:10:00.0', '2014-08-07 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-08 06:00:00.0', '2014-08-08 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-08 09:40:00.0', '2014-08-08 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-08 14:45:00.0', '2014-08-08 17:50:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-08 18:25:00.0', '2014-08-08 21:30:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-08 23:30:00.0', '2014-08-09 02:35:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-09 03:10:00.0', '2014-08-09 06:15:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-10 06:00:00.0', '2014-08-10 09:05:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (15, 1, 1880, '2014-08-10 09:40:00.0', '2014-08-10 12:45:00.0', 0, 215.25, null);
INSERT INTO flight(routeid, planeid, flightnumber, departuredate, arrivaldate, seatstaken, price, firstclassprice) VALUES (2, 1, 4214, '2014-08-10 14:45:00.0', '2014-08-10 17:50:00.0', 0, 215.25, null);
