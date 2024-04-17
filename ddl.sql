drop table if exists category cascade;
create table category
(
    id              integer primary key,
    title           varchar(255) not null,
    since_year      integer check ( since_year > 0 and since_year < 15 ),
    validity_period integer check ( validity_period > 0 )
);

drop table if exists figure_skater cascade;
create table figure_skater
(
    id           integer primary key,
    fullname     varchar(255)                                                             not null,
    birthday     date                                                                     not null,
    sex          varchar(1) check ( sex in ('f', 'm') )                                   not null,
    skating_type varchar(12) check ( skating_type in ('single', 'pairs', 'ice dancing') ) not null,
);

drop table if exists competition cascade;
create table competition
(
    id    integer primary key,
    date  date         not null,
    venue varchar(255) not null,
);

drop table if exists coach cascade;
create table coach
(
    id           integer primary key,
    category_id  integer references category (id)                                         not null,
    fullname     varchar(255)                                                             not null,
    sex          varchar(1) check ( sex in ('f', 'm') )                                                            not null,
    birthdate    date                                                                     not null,
    skating_type varchar(12) check ( skating_type in ('single', 'pairs', 'ice dancing') ) not null
);

drop table if exists skater_coach cascade;
create table skater_coach
(
    coach_id  integer references coach (id)         not null,
    skater_id integer references figure_skater (id) not null,
    primary key (coach_id, skater_id)
);

drop table if exists figure_skater_categories cascade;
create table figure_skater_categories
(
    skater_id       integer references figure_skater (id) not null,
    category_id     integer references category (id)      not null,
    assignment_date date check not null,
    primary key (skater_id, category_id)
);

drop table if exists medal cascade;
create table medal
(
    skater_id      integer references figure_skater (id)                       not null,
    competition_id integer references competition (id)                         not null,
    type           varchar(6) check ( type in ('golden', 'silver', 'bronze') ) not null,
    date           date check not null
        );