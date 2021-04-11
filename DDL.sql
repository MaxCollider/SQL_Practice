create table if not exists "Players"
(
	player_id serial not null
		constraint players_pk
			primary key,
	player_born_date date not null,
	player_country text not null,
	player_city text not null,
	player_sex char not null,
	player_name text not null,
	player_surname text not null
);

alter table "Players" owner to postgres;

create table if not exists "Titles"
(
	titles_id serial not null
		constraint titles_titles_id_uindex
			primary key,
	fide_title text,
	player_id integer not null
		constraint player_id
			references "Players",
	russian_tittle text
);

alter table "Titles" owner to postgres;

create index if not exists titles_fide_title_index
	on "Titles" (fide_title);

create index if not exists players_player_name_player_surname_index
	on "Players" (player_name, player_surname);

create table if not exists "Online_Players"
(
	online_player_id serial not null
		constraint online_players_pk
			primary key,
	player_id integer not null
		constraint online_player_id
			references "Players",
	nickname text not null,
	password varchar(100) not null,
	rating integer
);

alter table "Online_Players" owner to postgres;

create unique index if not exists online_players_nickname_uindex
	on "Online_Players" (nickname);

create table if not exists "Online_games"
(
	online_games_id serial not null
		constraint online_games_online_games_id_uindex
			primary key,
	player_white_id integer not null
		constraint player_id
			references "Online_Players",
	online_game_type text not null,
	game_result char not null,
	player_black_id integer not null
		constraint online_games_online_players_online_player_id_fk
			references "Online_Players"
);

alter table "Online_games" owner to postgres;

create index if not exists online_games_player_white_id_player_black_id_index
	on "Online_games" (player_white_id, player_black_id);

create table if not exists tournaments
(
	tour_id serial not null
		constraint tournaments_pk
			primary key,
	tour_date date not null,
	tour_name text not null,
	tour_country text not null,
	tour_city text not null
);

alter table tournaments owner to postgres;

create unique index if not exists tournaments_tour_name_uindex
	on tournaments (tour_name);

create table if not exists "Games"
(
	game_id serial not null,
	player_white_id integer not null
		constraint games_players_player_id_fk
			references "Players",
	game_type text not null,
	game_number smallint not null,
	tour_id integer not null
		constraint games_tournaments_tour_id_fk
			references tournaments,
	game_result char not null,
	player_black_id integer not null
		constraint games_players_player_id_fk_2
			references "Players"
);

alter table "Games" owner to postgres;

create index if not exists games_game_id_index
	on "Games" (game_id);

create index if not exists games_player_white_id_player_black_id_index
	on "Games" (player_white_id, player_black_id);

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

create table if not exists tournaments_x_players
(
	player_id integer not null
		constraint tournaments_x_players_players_player_id_fk
			references "Players",
	tour_id integer not null
		constraint tournaments_x_players_tournaments_tour_id_fk
			references tournaments,
	constraint tournaments_x_players_pkey
		primary key (player_id, tour_id)
);

alter table tournaments_x_players owner to postgres;

