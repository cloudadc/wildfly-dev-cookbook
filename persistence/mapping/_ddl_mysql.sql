
    alter table flight 
        drop 
        foreign key FK_h46vkwak01nbw3phahpod3csp;

    alter table flight 
        drop 
        foreign key FK_krkd0hvsfmwd3yjeneamamyj4;

    alter table reservation 
        drop 
        foreign key FK_7m9bdrwxo6kufsxyarkyb89mw;

    alter table reservation 
        drop 
        foreign key FK_fb8mwipr9j7qb6kc34ksu4ci1;

    alter table reservation 
        drop 
        foreign key FK_nptdplkx6oju7gaf4cno2lncm;

    alter table reservation 
        drop 
        foreign key FK_2dxcvp855bvlttgiudvv8j5pt;

    alter table route 
        drop 
        foreign key FK_gui2n1hsp6sds788j5quo7vk0;

    alter table route 
        drop 
        foreign key FK_nudqdpkihopy202ef21wtqtwv;

    alter table seat 
        drop 
        foreign key FK_3e8yqh3p6ejjadx8s4suiku62;

    alter table seat 
        drop 
        foreign key FK_rbdny92tj8iy8hclq4nrk1lld;

    alter table seat 
        drop 
        foreign key FK_pr6fh744yhu0iswhbjmvx9mws;

    drop table if exists airport;

    drop table if exists flight;

    drop table if exists plane;

    drop table if exists reservation;

    drop table if exists route;

    drop table if exists seat;

    drop table if exists user;

    drop table if exists val_mealtype;

    drop table if exists val_seatclass;

    drop table if exists val_seattype;

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

    create table val_mealtype (
        meal varchar(20) not null auto_increment,
        primary key (meal)
    );

    create table val_seatclass (
        class varchar(10) not null auto_increment,
        primary key (class)
    );

    create table val_seattype (
        seatposition varchar(10) not null auto_increment,
        primary key (seatposition)
    );

    alter table flight 
        add constraint FK_h46vkwak01nbw3phahpod3csp 
        foreign key (planeid) 
        references plane (planeid);

    alter table flight 
        add constraint FK_krkd0hvsfmwd3yjeneamamyj4 
        foreign key (routeid) 
        references route (routeid);

    alter table reservation 
        add constraint FK_7m9bdrwxo6kufsxyarkyb89mw 
        foreign key (flightid) 
        references flight (flightid);

    alter table reservation 
        add constraint FK_fb8mwipr9j7qb6kc34ksu4ci1 
        foreign key (seatid) 
        references seat (seatid);

    alter table reservation 
        add constraint FK_nptdplkx6oju7gaf4cno2lncm 
        foreign key (userid) 
        references user (userid);

    alter table reservation 
        add constraint FK_2dxcvp855bvlttgiudvv8j5pt 
        foreign key (meal) 
        references val_mealtype (meal);

    alter table route 
        add constraint FK_gui2n1hsp6sds788j5quo7vk0 
        foreign key (destinationairportid) 
        references airport (airportid);

    alter table route 
        add constraint FK_nudqdpkihopy202ef21wtqtwv 
        foreign key (originairportid) 
        references airport (airportid);

    alter table seat 
        add constraint FK_3e8yqh3p6ejjadx8s4suiku62 
        foreign key (planeid) 
        references plane (planeid);

    alter table seat 
        add constraint FK_rbdny92tj8iy8hclq4nrk1lld 
        foreign key (seatcategory) 
        references val_seatclass (class);

    alter table seat 
        add constraint FK_pr6fh744yhu0iswhbjmvx9mws 
        foreign key (seatposition) 
        references val_seattype (seatposition);
