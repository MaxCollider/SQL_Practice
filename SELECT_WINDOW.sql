-- Вывести вторых по фиде рейтингу шахматистов в каждом городе (если такие есть)

SELECT * FROM
(SELECT "Players".player_id,
        player_name,
        player_surname,
        row_number() over (partition by player_city ORDER BY fide_rating DESC ) AS top
 FROM "Players"
          JOIN "Rating"
               On "Rating".player_id = "Players".player_id
) raitings
WHERE top = 2;

-- Определяем топ 3 по рейтингу в онлайн играх

SELECT * FROM
(SELECT nickname, rating, row_number() over (ORDER BY rating DESC ) as place
FROM "Players" P JOIN "Online_Players" on P.player_id = "Online_Players".player_id) top_rating
WHERE place <= 3;

-- Вывести первые и вторые места игроков по российскому рейтингу в кажом турнире

SELECT * FROM
(SELECT player_name, player_surname, russian_rating, tour_name, row_number() over (PARTITION BY tour_name ORDER BY russian_rating) as position
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
JOIN (SELECT *
      FROM tournaments_x_players JOIN tournaments
    ON tournaments.tour_id = tournaments_x_players.tour_id
) tours
ON tours.player_id = "Players".player_id) result
WHERE position <= 2;

-- Вывести отклонение от среднего рейтинга по стране шахматистов мужского пола

SELECT * FROM
(SELECT "Players".player_id, player_name, player_sex, russian_rating - avg(russian_rating) over(PARTITION BY player_country) as divirgence
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id) divir
WHERE player_sex = 'M';

-- Вывести топ 3 по количеству букв в никнейме для каждого пола

SELECT * FROM
(SELECT
player_name, player_surname, nickname, row_number() over (PARTITION BY player_sex ORDER BY length(nickname)) as top_len
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
JOIN "Online_Players" ON "Online_Players".player_id = "Players".player_id) len_table
Where top_len <= 3;