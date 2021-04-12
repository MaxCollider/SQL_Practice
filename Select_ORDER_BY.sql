-- Список игроков отсортированных по суммарному рейтингу (С наибольшим рейтингом в начале списка)

SELECT player_name, player_surname
FROM "Rating" JOIN "Players"
ON "Rating".player_id = "Players".player_id
ORDER BY fide_rating + "Rating".russian_rating DESC;

-- Посчитать для каждого города количество игрокв с рейтингом и отсортировать их по максимальному рейтигу

SELECT player_city, count(*) as num
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
GROUP BY player_city
ORDER BY max(fide_rating) DESC;

-- Выбрать шахматистов чьё имя длиннее 5 букв и fide_id состоит из пяти цифр

SELECT player_name, player_surname, russian_rating
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
WHERE length(player_name) > 5 and fide_id >= 10000 and fide_id < 100000
ORDER BY russian_rating;

-- Выбрать игроков которые играли в турнире Moscow-Open, отсортировать по дате рождения

SELECT player_name, player_surname
FROM "Players" JOIN tournaments_x_players
ON "Players".player_id = tournaments_x_players.player_id
JOIN tournaments ON tournaments_x_players.tour_id = tournaments.tour_id
WHERE tournaments.tour_id = (SELECT tour_id FROM tournaments WHERE tour_name = 'Moscow-Open')
ORDER BY player_born_date;

-- Вывести количество игроков в городе и сумму российского рейтинга и рейтинга фиде для этих игроков, отсортировать по наибольшей сумме российского и фиде рейтинга

SELECT count(*), sum(fide_rating), sum(russian_rating)
FROM "Players" JOIN "Rating"
ON "Rating".player_id = "Players".player_id
WHERE player_sex = 'M'
GROUP BY player_city
ORDER BY sum(russian_rating) + sum(fide_rating)  DESC