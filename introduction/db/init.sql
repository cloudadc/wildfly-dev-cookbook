
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




