--Находим шахматистов с максимальным рейтингом не превышающим 2250 в своём городе

WITH group_city_max_rait(rait) AS (
    SELECT max(fide_rating) FROM "Rating" JOIN "Players"
    ON "Rating".player_id = "Players".player_id
    GROUP BY player_city
    HAVING max(fide_rating) < 2250
)

SELECT player_name, player_surname, player_city
FROM "Rating" JOIN "Players"
ON "Rating".player_id = "Players".player_id
WHERE fide_rating in (SELECT rait FROM group_city_max_rait);

-- Средний рейтинг в онлайн играх не менее чем 2300 для игроков каждого пола

SELECT player_sex, avg(rating)
FROM "Online_Players" JOIN "Players"
ON "Players".player_id = "Online_Players".player_id
GROUP BY player_sex
HAVING avg(rating) > 2300;

-- Средний российский рейтинг не превышающий 2100 для каждого титула
SELECT fide_title, avg(russian_rating)
FROM "Titles" JOIN "Players"
ON "Titles".player_id = "Players".player_id
JOIN "Rating"
ON "Rating".player_id = "Players".player_id
GROUP BY fide_title
HAVING avg(russian_rating) < 2100;

-- Самый высокий фиде рейтинг среди всех своего пола, который более чем 2000 из каждой страны

WITH group_country_max_rait(rait) AS (
    SELECT max(fide_rating) FROM "Rating" JOIN "Players"
    ON "Rating".player_id = "Players".player_id
    GROUP BY player_country, player_sex
    HAVING max(fide_rating) > 2000
)

SELECT player_sex, player_country, fide_rating
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
WHERE fide_rating in (SELECT rait FROM group_country_max_rait);

-- Такие города, что шахматистов с онлайн-рейтингом рейтингом не менее 2160 менее двух

SELECT player_city, count(*)
FROM "Players" JOIN "Online_Players"
ON "Players".player_id = "Online_Players".player_id
WHERE rating > 2160
GROUP BY player_city
HAVING count(*) < 2
