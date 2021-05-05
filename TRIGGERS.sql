CREATE OR REPLACE FUNCTION snitch() RETURNS event_trigger AS $$
BEGIN
    RAISE NOTICE 'Произошло событие: % %', tg_event, tg_tag;
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER snitch ON ddl_command_start EXECUTE PROCEDURE snitch();


CREATE OR REPLACE FUNCTION drop_duplicates()
RETURNS TRIGGER AS $$
    BEGIN
        DELETE FROM "Players" WHERE player_name = new.player_name and player_surname = new.player_surname;
    end;
$$ LANGUAGE plpgsql;

--Триггер для удаления копий

CREATE TRIGGER DELETE_COPIES BEFORE INSERT ON "Players"
    FOR EACH ROW EXECUTE PROCEDURE drop_duplicates();

DROP TRIGGER DELETE_COPIES ON "Players";

-- Событийный триггер запрещающий table_rewrite при выполнении некоторых условий:
-- 1) Если таблица состоит из более чем 10 видимых страниц
-- 2) Если перезапись происходит в любое время кроме 12 до 18

CREATE OR REPLACE FUNCTION no_rewrite()
 RETURNS event_trigger
 LANGUAGE plpgsql AS
$$
    DECLARE
        curr_hour int := extract('hour' from current_time);
        pages int;
        max_number_of_pages int := 10;
        table_oid oid := pg_event_trigger_table_rewrite_oid();
    BEGIN
        IF not (curr_hour > 12 and curr_hour < 18) then
            Raise EXCEPTION 'U can rewrite ONLY between 12 and 18';
        end if;

        SELECT INTO pages relallvisible FROM pg_class WHERE oid = table_oid;
        If pages >= max_number_of_pages then
            RAISE EXCEPTION 'You can not rewrite table with this number of pages';
        end if;
    end;
$$;

CREATE EVENT TRIGGER no_rewrite_allowed
ON table_rewrite EXECUTE PROCEDURE no_rewrite();

DROP EVENT TRIGGER no_rewrite_allowed;

