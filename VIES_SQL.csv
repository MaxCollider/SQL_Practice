--Вью, которая скрывает часть никнейма

CREATE OR REPLACE VIEW mask_nickname
as SELECT mask_all(nickname, 2, 1) as nickname, rating
FROM "Online_Players";

SELECT * FROM mask_nickname;

Drop view IF EXISTS mask_nickname;

--Вью, которая скрывает пароль полностью

CREATE VIEW mask_password
as SELECT player_name, player_surname, mask_all(password) as password
FROM "Players" JOIN "Online_Players"
ON "Players".player_id = "Online_Players".player_id;

SELECT * FROM  mask_password;

DROP view IF EXISTS mask_password;

--Таблица, которая содержит важную информацию про игроков

CREATE OR REPLACE VIEW player_full_information
as SELECT player_name, player_surname, player_sex, mask_all(text(player_born_date), 1, 1) as player_born_date, nickname, fide_title, fide_rating
FROM "Players" LEFT JOIN "Titles"
ON "Titles".player_id = "Players".player_id
LEFT JOIN  "Rating"
ON "Rating".player_id = "Players".player_id
LEFT JOIN "Online_Players"
ON "Online_Players".player_id = "Players".player_id;

SELECT * FROM player_full_information;

DROP VIEW player_full_information;

-- Функция, которая шифрует поданную на вход строку, с параметрами:
-- test - шифруемая строчка
-- left_offset - количество символов слева, которые видны
-- left_ofset - количество символов справа, которые видны

CREATE OR REPLACE FUNCTION mask_all(
    name text,
    left_offset integer,
    right_offset integer
)
RETURNS text AS $$
DECLARE
    answer text := '';
BEGIN
answer = left(name, left_offset);
    FOR i IN left_offset .. length(name) - right_offset by 1
        LOOP
        answer := concat(answer, '*');
        end loop;
    answer = concat(answer, right(name, right_offset));
    Return answer;
END;
$$ LANGUAGE plpgsql;

-- Вью с информацией по сыграным партиям, с именами и фамилиями игроков

CREATE OR REPLACE VIEW games_with_players
as SELECT player_white.player_name as white_player_name, player_white.player_surname as white_player_surname,
          player_black.player_name as black_player_name, player_black.player_surname as black_player_surname, tour_id, game_id, game_number, game_type, game_result
FROM "Games" JOIN "Players" player_white
ON player_white_id = player_white.player_id
JOIN "Players" player_black
ON player_black_id = player_black.player_id;

SELECT * FROM games_with_players;

DROP VIEW games_with_players;

-- Вью с информацией по сыграным онлайн играм, с никнеймами реальных игроков

CREATE OR REPLACE VIEW games_with_online_players
as SELECT white_Player.nickname as white_nickname, black_player.nickname as black_nickname, online_game_type, game_result
FROM "Online_games" JOIN "Online_Players" white_Player
ON player_white_id = white_Player.online_player_id
JOIN "Online_Players" black_player
ON player_black_id = black_player.online_player_id;

SELECT * FROM games_with_online_players;

DROP VIEW games_with_online_players;

--Вью с информацией по турнирам

CREATE OR REPLACE VIEW tournemant_with_games
AS SELECT DISTINCT tour_name, black_player.game_id, black_player.game_result, black_player.game_number, tour_date, tour_country
FROM (SELECT * FROM tournaments JOIN  tournaments_x_players ON tournaments.tour_id = tournaments_x_players.tour_id) as tour_x
JOIN "Games" black_player ON tour_x.player_id = player_black_id
JOIN "Games" white_player ON tour_x.player_id = white_player.player_white_id;

SELECT * FROM tournemant_with_games;


DROP VIEW tournemant_with_games;