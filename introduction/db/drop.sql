alter table flight drop foreign key fk_flight_to_plane;

alter table flight drop foreign key fk_flight_to_route;

alter table reservation drop foreign key fk_reservation_to_flight;

alter table reservation drop foreign key fk_reservation_to_seat;

alter table reservation drop foreign key fk_reservation_to_user;

alter table reservation drop foreign key fk_reservation_to_val_mealtype;

alter table route drop foreign key fk_route_to_airport;

alter table route drop foreign key fk_route_to_airport_ori;

alter table seat drop foreign key fk_seat_to_plane;

alter table seat drop foreign key fk_seat_to_val_seatclass;

alter table seat drop foreign key fk_seat_to_val_seattype;

alter table role drop foreign key fk_role_to_user;


drop table if exists airport;

drop table if exists flight;

drop table if exists plane;

drop table if exists reservation;

drop table if exists route;

drop table if exists seat;

drop table if exists user;

drop table if exists role;

drop table if exists val_mealtype;

drop table if exists val_seatclass;

drop table if exists val_seattype;
