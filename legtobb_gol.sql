SELECT p.full_name AS 'Név',
       t.team_name AS 'Csapat',
       COUNT(*) AS 'Gólok'
FROM Players p JOIN Teams t ON p.team_id = t.team_id
			   JOIN Goals g ON p.player_id = g.player_id
WHERE g.goal_type <> 'Own Goal'
GROUP BY p.full_name, t.team_name
ORDER BY Gólok DESC
LIMIT 10