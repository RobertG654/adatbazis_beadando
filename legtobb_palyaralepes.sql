SELECT p.full_name AS 'Név',
       t.team_name AS 'Csapat',
       p.appearances AS 'Pályára lépések'
FROM Players p JOIN Teams t ON p.team_id = t.team_id
ORDER BY p.appearances DESC