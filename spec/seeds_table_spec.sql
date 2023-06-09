DROP TABLE IF EXISTS users, spaces, bookings;

CREATE TABLE users
(
    id       SERIAL PRIMARY KEY,
    username text unique,
    name     text,
    email    text unique,
    password text
);

CREATE TABLE spaces
(
    id          SERIAL PRIMARY KEY,
    name        text,
    available   boolean,
    description text,
    price       int,
    user_id     int,
    constraint fk_user foreign key (user_id)
        references users (id)
        on delete cascade
);

CREATE TABLE bookings
(
    id              SERIAL PRIMARY KEY,
    date_of_booking date,
    approved        boolean,
    user_id         int,
    space_id        int,
    constraint fk_user foreign key (user_id)
        references users (id)
        on delete cascade,
    constraint fk_space foreign key (space_id)
        references spaces (id)
        on delete cascade
);
  