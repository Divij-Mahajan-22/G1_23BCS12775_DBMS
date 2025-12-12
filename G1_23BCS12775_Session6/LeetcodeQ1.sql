--G1_23BCS12775_Divij_Mahajan_Session6
WITH rek AS(
  SELECT *
  FROM movierating mr
  LEFT JOIN users u ON mr.user_id = u.user_id
  LEFT JOIN movies m ON mr.movie_id = m.movie_id)

, nam AS(
SELECT rek.name as results
FROM rek
GROUP BY rek.name
order by COUNT(*) DESC, rek.name
LIMIT 1)

, av AS(
SELECT rek.title AS results
FROM rek
WHERE rek.created_at BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY rek.title
ORDER BY AVG(RATING) DESC, rek.title 
LIMIT 1)

SELECT * FROM nam
UNION ALL
SELECT * FROM av
