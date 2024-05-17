CREATE FUNCTION add_competition(
    p_id INTEGER,
    p_title VARCHAR(255),
    p_date DATE,
    p_venue VARCHAR(255)
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO competition (id, title, date, venue)
    VALUES (p_id, p_title, p_date, p_venue);
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION update_figure_skater(
    p_skater_id INTEGER,
    p_fullname VARCHAR(255),
    p_birthday DATE,
    p_sex VARCHAR(1),
    p_skating_type VARCHAR(12)
)
RETURNS VOID AS
$$
BEGIN
    UPDATE figure_skater
    SET fullname = p_fullname, birthday = p_birthday, sex = p_sex, skating_type = p_skating_type
    WHERE id = p_skater_id;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION add_skater_category(
    p_skater_id INTEGER,
    p_category_id INTEGER,
    p_assignment_date DATE
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO figure_skater_categories (skater_id, category_id, assignment_date)
    VALUES (p_skater_id, p_category_id, p_assignment_date);
END;
$$ LANGUAGE plpgsql;


