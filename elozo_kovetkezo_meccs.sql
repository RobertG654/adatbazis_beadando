SELECT hcs.team_name AS 'Hazai csapat',
       ics.team_name AS 'Idegen csapat',
       m.match_date AS 'Dátum',
       COALESCE(CAST(LAG(m.match_date, 1, NULL) OVER (PARTITION BY m.home_team_id ORDER BY m.match_date) AS CHAR(10)), 'Nincs előző meccs') AS 'Előző meccs dátuma',
       COALESCE(CAST(LEAD(m.match_date, 1, NULL) OVER (PARTITION BY m.home_team_id ORDER BY m.match_date) AS CHAR(10)), 'Nincs következő meccs') AS 'Következő meccs dátuma'
FROM Matches m JOIN Teams hcs ON m.home_team_id = hcs.team_id
			   JOIN Teams ics ON m.away_team_id = ics.team_id
WHERE m.home_team_id IS NOT NULL
ORDER BY hcs.team_name, m.match_date