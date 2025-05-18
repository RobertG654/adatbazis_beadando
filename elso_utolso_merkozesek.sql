WITH OsszesMeccs AS (
    SELECT home_team_id AS team_id, match_date FROM Matches
    UNION
    SELECT away_team_id AS team_id, match_date FROM Matches
)
SELECT DISTINCT
    t.team_name AS 'Csapat',
    FIRST_VALUE(om.match_date) OVER (PARTITION BY om.team_id ORDER BY om.match_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'Első meccs dátuma',
    LAST_VALUE(om.match_date) OVER (PARTITION BY om.team_id ORDER BY om.match_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'Utolsó meccs dátuma'
FROM Teams t
JOIN OsszesMeccs om ON t.team_id = om.team_id