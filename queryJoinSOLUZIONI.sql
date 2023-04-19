-- 1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
SELECT players.name, players.lastname FROM players INNER JOIN reviews ON players.id = reviews.player_id GROUP BY players.id, players.name, players.lastname;

-- 2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
SELECT videogames.name FROM tournament_videogame 
INNER JOIN videogames ON videogame_id = videogames.id 
INNER JOIN tournaments ON tournament_id = tournaments.id 
WHERE tournaments.year = 2016 GROUP BY videogames.name;

-- 3- Mostrare le categorie di ogni videogioco (1718)
SELECT videogames.name, categories.name FROM category_videogame 
INNER JOIN videogames ON videogame_id = videogames.id
INNER JOIN categories ON category_id = categories.id;

-- 4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
SELECT software_houses.name FROM software_houses
INNER JOIN videogames ON videogames.software_house_id = software_houses.id
WHERE YEAR(videogames.release_date) > 2020
GROUP BY software_houses.name;

-- 5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
SELECT software_houses.name, videogames.name, awards.name
FROM software_houses
INNER JOIN videogames ON videogames.software_house_id = software_houses.id
INNER JOIN award_videogame ON videogames.id = award_videogame.videogame_id
INNER JOIN awards ON award_videogame.award_id = awards.id
GROUP BY  software_houses.name, videogames.name, awards.name

-- 6- Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)
SELECT DISTINCT videogames.name, categories.name, pegi_labels.name
FROM videogames
INNER JOIN reviews ON videogames.id = reviews.videogame_id
INNER JOIN category_videogame ON videogames.id = category_videogame.videogame_id
INNER JOIN categories ON category_videogame.category_id = categories.id
INNER JOIN pegi_label_videogame ON pegi_label_videogame.videogame_id = videogames.id
INNER JOIN pegi_labels ON pegi_label_videogame.pegi_label_id = pegi_labels.id
WHERE reviews.rating >= 4

-- 7- Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)
SELECT videogames.name
FROM videogames
INNER JOIN tournament_videogame ON videogames.id = tournament_videogame.videogame_id
INNER JOIN player_tournament ON tournament_videogame.tournament_id = player_tournament.tournament_id
INNER JOIN players ON players.id = player_tournament.player_id
WHERE players.name LIKE 'S%'
GROUP BY videogames.id, videogames.name;

-- 8- Selezionare le citt� in cui � stato giocato il gioco dell'anno del 2018 (36)
SELECT DISTINCT tournaments.city
FROM tournaments
INNER JOIN tournament_videogame ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN award_videogame ON tournament_videogame.videogame_id = award_videogame.videogame_id
INNER JOIN awards ON awards.id = award_videogame.award_id
WHERE awards.id = 1 AND tournaments.year = 2018;

-- 9- Selezionare i giocatori che hanno giocato al gioco pi� atteso del 2018 in un torneo del 2019 (3306)
-- *********** BONUS ***********
-- 10- Selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)
-- 11- Selezionare i dati del videogame (id, name, release_date, totale recensioni) con pi� recensioni (videogame id : 398)
-- 12- Selezionare la software house che ha vinto pi� premi tra il 2015 e il 2016 (software house id : 1)
-- 13- Selezionare le categorie dei videogame i quali hanno una media recensioni inferiore a 2 (10)