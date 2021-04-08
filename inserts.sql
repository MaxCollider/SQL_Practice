INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname)
VALUES ('2001-04-07', 'Russia', 'Moscow', 'M', 'Andrew', 'Golubov');

DELETE FROM "Players"
WHERE player_name = 'Andrew' and player_surname = 'Golubov';

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname)
VALUES ('2000-04-23', 'Russia', 'Saint Petersburg', 'M', 'Valery', 'Romanov');

DELETE FROM "Players"
WHERE player_name = 'Valery';

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname)
VALUES ('2000-09-14', 'USA', 'New York City', 'M', 'Sam', 'Fisher');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname)
VALUES ('2004-09-14', 'USA', 'New York City', 'M', 'Tyler', 'Durden');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname)
VALUES ('1989-03-25', 'Russia', 'Moscow', 'M', 'Valery', 'Skatkov');

DELETE FROM "Players"
WHERE player_surname = 'Durden';

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname)
VALUES ('2003-11-22', 'Russia', 'Samara', 'M', 'Sergey', 'Morgachev');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2004-03-14', 'Russia', 'Samara', 'M', 'Yaroslav', 'Trifonov');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2001-08-01', 'Russia', 'Ekaterinburg', 'F', 'Maria', 'Mahno');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2001-07-19', 'Russia', 'Syzran', 'M', 'Nikita', 'Kosyrev');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2002-05-21', 'Russia', 'Samara', 'M', 'Alexander', 'Suvorov');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2001-04-07', 'Russia', 'Tolyatti', 'F', 'Polina', 'Gutkovich');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2000-01-13', 'Russia', 'Saint Petersburg', 'M', 'Semyon', 'Kosynkin');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2005-11-17', 'Russia', 'Moscow', 'M', 'Andrew', 'Tsvetkov');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2003-12-30', 'Russia', 'Tolyatti', 'M', 'Vladislav', 'Bratchikov');

INSERT INTO "Players"
(player_born_date, player_country, player_city, player_sex, player_name, player_surname) VALUES
('2001-07-19', 'Russia', 'Syzran', 'M', 'Danila', 'Kosyrev');
---------------------------------------------------------------------------------------------


INSERT INTO "Titles"
(fide_title, player_id, russian_tittle) VALUES
('CM', (SELECT player_id FROM "Players" WHERE player_name = 'Sam' and player_surname = 'Fisher'), 'КМС');

INSERT INTO "Titles"
(fide_title, player_id, russian_tittle) VALUES
('GM', (SELECT player_id FROM "Players" WHERE player_name = 'Andrew' and player_surname = 'Golubov'), 'МР');

INSERT INTO "Titles"
(fide_title, player_id, russian_tittle) VALUES
('CM', (SELECT player_id FROM  "Players" WHERE player_name = 'Sergey' and player_surname = 'Morgachev'), 'КМС');

INSERT INTO "Titles"
(fide_title, player_id, russian_tittle) VALUES
('FM', (SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov'), 'КМС');

INSERT INTO "Titles"
(fide_title, player_id, russian_tittle) VALUES
('WFM', (SELECT player_id FROM  "Players" WHERE  player_name = 'Maria' and player_surname = 'Mahno'), 'ЖМФ');

INSERT INTO  "Titles"
(fide_title, player_id, russian_tittle) VALUES
('FM', (SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'), 'МР');

INSERT INTO "Titles"
(fide_title, player_id, russian_tittle) VALUES
('FM', (SELECT  player_id FROM "Players" WHERE player_name = 'Semyon' and player_surname = 'Kosynkin'), 'ГР');

INSERT INTO "Titles"
(fide_title, player_id, russian_tittle) VALUES
('IM', (SELECT player_id FROM  "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev'), 'КМС');

DELETE FROM "Titles"
WHERE player_id = (SELECT player_id FROM "Players" WHERE player_name = 'Maria');

DELETE FROM "Titles"
WHERE player_id = (SELECT player_id FROM  "Players" WHERE player_surname = 'Kosyrev');

-------------------------------------------------------------------------------------------------------

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM  "Players" WHERE  player_name = 'Maria' and player_surname = 'Mahno'), 2314, 1893, 2313);

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Sam' and player_surname = 'Fisher'), 21341, 2210, 2192);

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Andrew' and player_surname = 'Golubov'), 93278, 2213, 2134);

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM  "Players" WHERE player_name = 'Sergey' and player_surname = 'Morgachev'), 23429, 1898, 1923);

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov'), 72831, 2491, 2201);

INSERT INTO  "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov'), 39282, 2001, 2094);

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'), 8738, 2301, 2143);

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT  player_id FROM "Players" WHERE player_name = 'Semyon' and player_surname = 'Kosynkin'), 29322, 2407, 2345);

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM  "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev'), 62872, 1893, 1783);

DELETE FROM "Rating"
WHERE fide_id = 72831;

INSERT INTO "Rating"
(player_id, fide_id, fide_rating, russian_rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Danila' and player_surname = 'Kosyrev'), 23723, 1564, 1634);


---------------------------------------------------------------------------------------------------------------------

DELETE FROM tournaments
WHERE tour_name = 'Moscow-Open';

DELETE FROM tournaments
WHERE tour_name = 'New York City';

DELETE FROM tournaments WHERE true;

INSERT INTO tournaments
(tour_date, tour_name, tour_country, tour_city) VALUES
('2012-09-23', 'Moscow-Open', 'Russia', 'Moscow');

INSERT INTO tournaments
(tour_date, tour_name, tour_country, tour_city) VALUES
('2014-08-13', 'Fisher Memorial','USA', 'New York City');

INSERT INTO tournaments
(tour_date, tour_name, tour_country, tour_city) VALUES
('2014-08-13', 'PRIfo', 'Russia', 'Samara');

DELETE FROM tournaments WHERE tour_name = 'Moscow-Open';

----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM  "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev'), 'NickKos', '190712', 2590);

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov'), 'Karatel', 'kjsdfjl', 2200);

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM  "Players" WHERE player_name = 'Andrew' and player_surname = 'Tsvetkov'), 'Colorit', 'hj3j54k45b', 2245);

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Semyon' and player_surname = 'Kosynkin'), 'JuatChaos', 'JustChaos', 2454);

UPDATE "Online_Players"
SET nickname = 'JustChaos'
WHERE player_id = (SELECT player_id FROM "Players" WHERE player_name = 'Semyon' and player_surname = 'Kosynkin');

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Polina' and player_surname = 'Gutkovich'), 'Polynom', 'le34pa', 2134);

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'), 'Sanches', 'destroythemwithlasers', 2283);

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Tyler' and player_surname = 'Durden'), 'TylerDurden', 'dontexist', 2312);

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM  "Players" WHERE  player_name = 'Maria' and player_surname = 'Mahno'), 'mari_sanna', '2384j435n34', 2473);

INSERT INTO "Online_Players"
(player_id, nickname, password, rating) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Sam' and player_surname = 'Fisher'), 'NewFicher', 'h5j23h4g5', 1984);

----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Andrew' and player_surname = 'Tsvetkov') ,(SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev') ,(SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov') ,(SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Polina' and player_surname = 'Gutkovich') ,(SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Maria' and player_surname = 'Mahno') ,(SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov') ,(SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Sam' and player_surname = 'Fisher'), (SELECT tour_id FROM  tournaments WHERE tour_name = 'Fisher Memorial'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Tyler' and player_surname = 'Durden'), (SELECT tour_id FROM  tournaments WHERE tour_name = 'Fisher Memorial'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Valery' and player_surname = 'Romanov'), (SELECT tour_id FROM  tournaments WHERE tour_name = 'Fisher Memorial'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev'), (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Polina' and player_surname = 'Gutkovich'), (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Andrew' and player_surname = 'Tsvetkov'), (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'), (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'));

INSERT INTO tournaments_x_players
(player_id, tour_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Sergey' and player_surname = 'Morgachev'), (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'));

----------------------------------------------------------------------------------------------------------------------------------------
WITH Suv_id(p_id) AS (
    SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'
)

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT p_id FROM Suv_id ), 'Classic', 4, (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'),
'W', (SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov'));

UPDATE "Games"
SET player_black_id = (SELECT player_id FROM "Players" WHERE player_name = 'Maria' and player_surname = 'Mahno')
WHERE player_black_id = (SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov');

UPDATE "Games"
SET game_number = '6'
WHERE player_black_id = (SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov');

UPDATE "Games"
SET game_result = 'D'
WHERE player_black_id = (SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov');

UPDATE "Games"
SET tour_id = (SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open');

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev'), 'Classic', 9, (SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'),
'W', (SELECT player_id FROM "Players" WHERE player_name = 'Andrew' and player_surname = 'Tsvetkov'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Andrew' and player_surname = 'Tsvetkov'), 'Classic', 1, (SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'),
'B', (SELECT player_id FROM "Players" WHERE player_name = 'Polina' and player_surname = 'Gutkovich'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'), 'Classic', 3, (SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'),
'D', (SELECT player_id FROM "Players" WHERE player_name = 'Maria' and player_surname = 'Mahno'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'), 'Rapid', 8, (SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open'),
'W', (SELECT player_id FROM "Players" WHERE player_name = 'Yaroslav' and player_surname = 'Trifonov'));


INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev'), 'Classic', 3, (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'),
'B', (SELECT player_id FROM "Players" WHERE player_name = 'Polina' and player_surname = 'Gutkovich'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Sergey' and player_surname = 'Morgachev'), 'Classic', 3, (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'),
'D', (SELECT player_id FROM "Players" WHERE player_name = 'Andrew' and player_surname = 'Tsvetkov'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Polina' and player_surname = 'Gutkovich'), 'Classic', 5, (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'),
'B', (SELECT player_id FROM "Players" WHERE player_name = 'Sergey' and player_surname = 'Morgachev'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov'), 'Classic', 9, (SELECT tour_id FROM tournaments WHERE tour_name = 'PRIfo'),
'B', (SELECT player_id FROM "Players" WHERE player_name = 'Nikita' and player_surname = 'Kosyrev'));

UPDATE "Games" SET
game_result = 'W'
WHERE player_white_id = (SELECT player_id FROM "Players" WHERE player_name = 'Alexander' and player_surname = 'Suvorov');

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Sam' and player_surname = 'Fisher'), 'Classic', 9, (SELECT tour_id FROM tournaments WHERE tour_name = 'Fisher Memorial'),
'W', (SELECT player_id FROM "Players" WHERE player_name = 'Tyler' and player_surname = 'Durden'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Sam' and player_surname = 'Fisher'), 'Classic', 4, (SELECT tour_id FROM tournaments WHERE tour_name = 'Fisher Memorial'),
'D', (SELECT player_id FROM "Players" WHERE player_name = 'Valery' and player_surname = 'Romanov'));

INSERT INTO "Games"
(player_white_id, game_type, game_number, tour_id, game_result, player_black_id) VALUES
((SELECT player_id FROM "Players" WHERE player_name = 'Valery' and player_surname = 'Romanov'), 'Classic', 3, (SELECT tour_id FROM tournaments WHERE tour_name = 'Fisher Memorial'),
'W', (SELECT player_id FROM "Players" WHERE player_name = 'Tyler' and player_surname = 'Durden'));

DELETE FROM "Games"
WHERE game_id = 20 or game_id = 18 or game_id = 21;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'mari_sanna'), 'bullet', 'W', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Polynom'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'NewFicher'), 'bullet', 'D', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'mari_sanna'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Colorit'), 'rapid', 'D', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'TylerDurden'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'JustChaos'), 'blitz', 'W', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'NickKos'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Karatel'), 'bullet', 'B', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'mari_sanna'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'JustChaos'), 'blitz', 'B', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'TylerDurden'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Polynom'), 'blitz', 'W', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'mari_sanna'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Colorit'), 'rapid', 'W', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'NewFicher'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'TylerDurden'), 'blitz', 'D', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'mari_sanna'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Polynom'), 'bullet', 'W', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Colorit'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Karatel'), 'bullet', 'B', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'JustChaos'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Karatel'), 'rapid', 'W', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'JustChaos'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Karatel'), 'blitz', 'D', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'JustChaos'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Polynom'), 'bullet', 'B', (SELECT online_player_id FROM "Online_Players" WHERE nickname = 'NewFicher'));

INSERT INTO "Online_games"
(player_white_id, online_game_type, game_result, player_black_id) VALUES
((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'NickKos'), 'blitz', 'B', ((SELECT online_player_id FROM "Online_Players" WHERE nickname = 'Colorit')));

