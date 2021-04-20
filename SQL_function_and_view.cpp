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


CREATE OR REPLACE VIEW games_with_players
as SELECT game_id, player_white_id, (SELECT player_id FROM "Players") as player_white, game_type, game_number, tour_id
FROM "Games" JOIN "Players"
ON player_white_id = "Players".player_id and player_black_id = "Players".player_id;

--


