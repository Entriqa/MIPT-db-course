SELECT fullname
FROM figure_skater
JOIN figure_skater_categories ON figure_skater.id = figure_skater_categories.skater_id
JOIN category ON figure_skater_categories.category_id = category.id
WHERE category.title = 'Мастер спорта международного класса';

-- Выведем всех мсмк

SELECT fullname, COUNT(medal.skater_id) AS total_medals
FROM figure_skater
LEFT JOIN medal ON figure_skater.id = medal.skater_id
GROUP BY fullname;

-- Выведем сколько медалей у каждого из фигуристов

SELECT fullname, birthday
FROM figure_skater
ORDER BY birthday ASC
LIMIT 1;

SELECT fullname, birthday
FROM figure_skater
ORDER BY birthday DESC
LIMIT 1;

-- Выведем самого маленького и самого взрослого фигуриста

SELECT coach.fullname AS coach_name, COUNT(skater_coach.skater_id) AS total_skaters
FROM coach
LEFT JOIN skater_coach ON coach.id = skater_coach.coach_id
GROUP BY coach.fullname;

-- Выведем количество подопечных у каждого тренера

SELECT coach.fullname AS coach_name,
    (SELECT COUNT(medal.skater_id)
    FROM skater_coach
    LEFT JOIN medal ON skater_coach.skater_id = medal.skater_id
    WHERE skater_coach.coach_id = coach.id) AS total_medals
FROM coach;

-- Выведем количество медалей на каждого тренера

SELECT competition.title, COUNT(medal.skater_id) AS total_participants
FROM competition
LEFT JOIN medal ON competition.id = medal.competition_id
GROUP BY competition.title
HAVING COUNT(medal.skater_id) > 5;

-- Выведем соревнования, в которых призовые места заняли больше 5 фигуристов из таблицы


SELECT figure_skater.fullname,
       COUNT(medal.skater_id) AS total_gold_medals
FROM figure_skater
JOIN medal ON figure_skater.id = medal.skater_id
WHERE medal.type = 'golden'
GROUP BY figure_skater.fullname
ORDER BY total_gold_medals DESC
LIMIT 1;

-- Выведем фигуриста, у которого больше всего золотых медалей

SELECT coach.fullname AS coach_name,
       COUNT(medal.skater_id) AS total_gold_medals
FROM coach
JOIN skater_coach ON coach.id = skater_coach.coach_id
JOIN medal ON skater_coach.skater_id = medal.skater_id
WHERE medal.type = 'golden'
GROUP BY coach.fullname
ORDER BY total_gold_medals DESC
LIMIT 5;

-- Выведем топ 5 тренеров - будем считать, чем больше золотых медлей - тем лучше

SELECT fullname, birthday
FROM figure_skater
WHERE EXTRACT(MONTH FROM birthday) IN (12, 1, 2);

-- Так как это зимний вид спорта, выведем всех фигуристов, у которых день рождения зимой

SELECT figure_skater.fullname,
       COUNT(medal.competition_id) AS total_competitions
FROM figure_skater
JOIN medal ON figure_skater.id = medal.skater_id
GROUP BY figure_skater.fullname
ORDER BY total_competitions DESC
LIMIT 5;

-- Выведем топ 5 активно принимающих участие в соревнованиях фигуристов