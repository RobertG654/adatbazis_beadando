SELECT full_name AS 'Név',
	   yellow_cards AS 'Sárga lapok',
       red_cards AS 'Piros lapok',
       (yellow_cards + red_cards) AS 'Össz'
FROM players
ORDER BY Össz DESC