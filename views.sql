
-- фигуристы и их тренера
CREATE VIEW skaters_and_coaches_view AS
SELECT fs.fullname AS skater_name, fs.birthday AS skater_birthday, fs.sex AS skater_sex, fs.skating_type AS skater_skating_type,
       c.fullname AS coach_name, c.birthdate AS coach_birthdate, c.sex AS coach_sex, c.skating_type AS coach_skating_type
FROM figure_skater fs
JOIN skater_coach sc ON fs.id = sc.skater_id
JOIN coach c ON sc.coach_id = c.id;


-- победители каждого из соревнований
CREATE VIEW competition_winners_and_coaches_view AS
SELECT comp.title AS competition_title, fs.fullname AS winner_name, fs.birthday AS winner_birthday, fs.sex AS winner_sex, fs.skating_type AS winner_skating_type,
       c.fullname AS coach_name, c.birthdate AS coach_birthdate, c.sex AS coach_sex, c.skating_type AS coach_skating_type
FROM competition comp
JOIN medal m ON comp.id = m.competition_id
JOIN figure_skater fs ON m.skater_id = fs.id
JOIN skater_coach sc ON fs.id = sc.skater_id
JOIN coach c ON sc.coach_id = c.id;


-- медали всех фигуристов и информация о каждом из них
CREATE VIEW skater_medals_view AS
SELECT fs.fullname AS skater_name, comp.title AS competition_title, m.type AS medal_type
FROM figure_skater fs
JOIN medal m ON fs.id = m.skater_id
JOIN competition comp ON m.competition_id = comp.id;