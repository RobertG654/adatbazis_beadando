SELECT M.match_date AS 'Dátum',
	   hcs.team_name AS 'Hazai csapat',
       ics.team_name AS 'Idegen csapat',
    (SELECT COUNT(*)
     FROM Goals g
     WHERE g.match_id = m.match_id AND g.team_id = m.home_team_id) AS 'Hazai gólok száma',
    (SELECT COUNT(*)
     FROM Goals g
     WHERE g.match_id = m.match_id AND g.team_id = m.away_team_id) AS 'Idegen gólok száma',
    s.stadium_name AS 'Stadion'
FROM Matches m JOIN Teams hcs ON m.home_team_id = hcs.team_id
			   JOIN Teams ics ON m.away_team_id = ics.team_id
			   JOIN Stadiums s ON m.stadium_id = s.stadium_id
WHERE M.game_week = 1