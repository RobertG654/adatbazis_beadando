SELECT p.full_name
FROM Players p
WHERE(
     SELECT COUNT(*)
	 FROM Goals G
	 JOIN Matches M ON G.match_id = M.match_id
	 WHERE G.player_id = P.player_id AND G.team_id = P.team_id
									 AND P.team_id = M.away_team_id
									 AND G.goal_type <> 'Own Goal'
    ) > (
        SELECT COUNT(*)
        FROM Goals G
        JOIN Matches M ON G.match_id = M.match_id
        WHERE G.player_id = P.player_id AND G.team_id = P.team_id
										AND P.team_id = M.home_team_id
										AND G.goal_type <> 'Own Goal'
    )
LIMIT 1