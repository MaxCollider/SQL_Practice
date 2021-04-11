SELECT player_white_id, player_black_id, game_result
FROM "Games"
WHERE game_result = 'B' and tour_id = (SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open');

SELECT player_name, player_surname, fide_rating, russian_rating
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
WHERE "Players".player_id in (SELECT player_id FROM "Rating" WHERE fide_rating > 2200);

SELECT player_name, player_surname, tour_name
FROM "Players" JOIN (SELECT * FROM tournaments_x_players JOIN tournaments
ON tournaments.tour_id = tournaments_x_players.tour_id) AS tours
ON "Players".player_id = tours.player_id
WHERE tour_name = 'Moscow-Open' and player_sex = 'M';

SELECT player_name, player_surname
FROM "Players"
WHERE player_id in (SELECT player_id FROM tournaments_x_players JOIN tournaments
ON tournaments.tour_id = tournaments_x_players.tour_id
WHERE tour_date < '2013-01-01')
and player_city = 'Samara';

SELECT player_name, nickname
FROM "Players" JOIN "Online_Players"
ON "Players".player_id = "Online_Players".player_id
WHERE "Players".player_id in (SELECT "Players".player_id FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id WHERE russian_rating > 2000 and fide_rating < 2200);

SELECT player_name, player_surname
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
WHERE fide_rating = (SELECT "Rating".player_id FROM "Rating" Group By fide_rating HAVING fide_rating = max(fide_rating));

WITH max_rait(fide_max) AS
(
    SELECT max(fide_rating)
    FROM "Rating"
)

SELECT player_name, player_surname, fide_rating
FROM "Rating" JOIN "Players"
ON "Rating".player_id = "Players".player_id
WHERE fide_rating = (SELECT fide_max FROM max_rait);

SELECT player_name, player_surname
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
WHERE fide_rating < 2100

INTERSECT

SELECT player_name, player_surname
FROM "Players" JOIN "Titles"
ON "Titles".player_id = "Players".player_id
WHERE fide_title = 'IM';

SELECT avg(fide_rating)
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
WHERE player_city = 'Samara' and player_sex = 'M';

SELECT count(player_id)
FROM "Players"
WHERE player_born_date < '2002-07-05' and player_city = 'Moscow';

WITH best_online(rait) AS (
    SELECT max(rating)
    FROM "Online_Players"
)

SELECT player_name, player_surname, nickname
FROM "Players" JOIN "Online_Players"
ON "Players".player_id = "Online_Players".player_id
WHERE rating = (Select rait FROM best_online);
