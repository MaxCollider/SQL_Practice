-- Функция, которая шифрует поданную на вход строку, с параметрами:
-- test - шифруемая строчка
-- left_offset - количество символов слева, которые видны
-- left_ofset - количество символов справа, которые видны

CREATE OR REPLACE FUNCTION mask_all(
    name text,
    left_offset integer,
    right_offset integer
)
    RETURNS text AS
$$
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

-- Функция, которая, принимает на вход имя и фамилию игрока, а возращает количество сыгранных партий

CREATE OR REPLACE FUNCTION players_games(
    player_name text,
    player_surname text
)
    RETURNS int as
$$
DECLARE
    result int := 0;
BEGIN
    EXECUTE format('SELECT count(*)
FROM "Games"
WHERE player_white_id in (SELECT player_id FROM "Players" WHERE player_name = ''%s'' and player_surname = ''%s'') or player_black_id in (SELECT player_id FROM "Players" WHERE player_name = ''%s'' and player_surname = ''%s'')',
                   player_name, player_surname, player_name, player_surname)
        INTO result;
    RETURN result;
end;
$$ LANGUAGE plpgsql;

SELECT players_games('Tyler', 'Durden');


-- Функция, которая, принимает на вход имя и фамилию игрока, а средний из всех рейтингов(российский, fide, онлайн)

CREATE OR REPLACE FUNCTION players_games(
    player_name text,
    player_surname text
)
    RETURNS int as
$$
DECLARE
    result int := 0;
BEGIN
    EXECUTE format('SELECT count(*)
FROM "Games"
WHERE player_white_id in (SELECT player_id FROM "Players" WHERE player_name = ''%s'' and player_surname = ''%s'') or player_black_id in (SELECT player_id FROM "Players" WHERE player_name = ''%s'' and player_surname = ''%s'')',
                   player_name, player_surname, player_name, player_surname)
        INTO result;
    RETURN result;
end;
$$ LANGUAGE plpgsql;

SELECT players_games('Tyler', 'Durden');

-- Функция, которая маскирует email, маскирует первые несколько цифр, и несколько последних

CREATE OR REPLACE FUNCTION mask_email(
    email text,
    offset_left int,
    offset_right int
)
RETURNS text AS $$
DECLARE
    answer text:= '';
BEGIN
        answer = concat(answer, left(email, offset_left));

    For i in offset_left .. length(split_part($1, '@', 1)) - offset_right
    LOOP
    answer = concat(answer, '*');
    end loop;
    answer = concat(answer, right(split_part($1, '@', 1), offset_right));
    answer = concat(answer, '@');
    answer = concat(answer, split_part($1, '@', 2));
    return answer;
END
$$ LANGUAGE plpgsql;

SELECT mask_email('MishaPidor@mail.ru', 1, 2);