create table if not exists "Players"
(
	player_id serial not null
		constraint players_pk
			primary key,
	player_born_date date,
	player_country text,
	player_city text,
	player_sex char
);

alter table "Players" owner to postgres;

create table if not exists "Titles"
(
	titles_id serial not null
		constraint titles_pk
			primary key,
	fide_title text,
	player_id integer not null
		constraint player_id
			references "Players",
	russian_tittle text
);

alter table "Titles" owner to postgres;

create table if not exists "Online_Players"
(
	online_player_id serial not null
		constraint online_players_pk
			primary key,
	player_id integer not null
		constraint online_player_id
			references "Players",
	nickname text not null,
	password integer not null,
	rating integer
);

alter table "Online_Players" owner to postgres;

create table if not exists "Online_games"
(
	online_games_id serial not null
		constraint online_games_pk
			primary key,
	player_id integer
		constraint player_id
			references "Online_Players",
	online_game_type text not null
);

alter table "Online_games" owner to postgres;

create table if not exists tournaments
(
	tour_id serial not null
		constraint tournaments_pk
			primary key,
	player_id integer not null
		constraint tout_id
			references "Players",
	tour_date date not null,
	tour_name text not null,
	tour_country text not null,
	tour_city text not null
);

alter table tournaments owner to postgres;

create table if not exists "Games"
(
	game_id serial not null
		constraint games_pk
			primary key,
	player_id integer not null
		constraint games_players_player_id_fk
			references "Players",
	game_type text not null,
	game_number smallint not null,
	tour_id integer not null
		constraint games_tournaments_tour_id_fk
			references tournaments
);

alter table "Games" owner to postgres;

create table if not exists "Rating"
(
	rating_id serial not null
		constraint rating_pk
			primary key,
	player_id integer not null
		constraint player_id
			references "Players",
	fide_id integer not null,
	fide_rating smallint,
	russian_rating smallint
);

alter table "Rating" owner to postgres;

create unique index if not exists rating_fide_id_uindex
	on "Rating" (fide_id);

