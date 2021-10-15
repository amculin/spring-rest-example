SET session_replication_role = 'replica';

INSERT INTO actor (first_name, last_name)
VALUES
    ('Cruise', 'Tom'),
    ('Fergusson', 'Rebecca'),
    ('Kirby', 'Vanessa'),
    ('Atwell', 'Hayley'),
    ('Statham', 'Jason'),
    ('Mirren', 'Hellen'),
    ('Diesel', 'Vin'),
    ('Rodriguez', 'Michelle'),
    ('Eckhart', 'Aaron'),
    ('Butler', 'Gerard'),
    ('Bassett', 'Angela'),
    ('Evans', 'Chris');

INSERT INTO director (first_name, last_name)
VALUES
    ('Whedon', 'Josh'),
    ('McQuarrie', 'Christopher'),
    ('Leitch', 'David'),
    ('Fuqua', 'Antoine'),
    ('Liebesman', 'Jonathan'),
    ('Lin', 'Justin');

INSERT INTO genre ("name")
VALUES
    ('Action'),
    ('Adventure'),
    ('Thriller'),
    ('Crime'),
    ('Sci-Fi');

INSERT INTO movie ("name", director_id, release_year)
VALUES
    ('Olympus Has Fallen', 4, 2013),
    ('Battle: Los Angeles', 5, 2011),
    ('Avengers: Age of Ultron', 1, 2015),
    ('F9', 6, 2021),
    ('Mission: Impossible - Fallout', 2, 2018),
    ('Hobbs & Shaw', 3, 2019);

INSERT INTO actor_movie (actor_id, movie_id)
VALUES
    (1, 5),
    (2, 5),
    (3, 5),
    (3, 6),
    (4, 3),
    (5, 4),
    (5, 6),
    (6, 4),
    (6, 6),
    (7, 4),
    (8, 2),
    (8, 9),
    (9, 2),
    (10, 2),
    (11, 2),
    (12, 3);

INSERT INTO genre_movie (movie_id, genre_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 1),
    (2, 3),
    (2, 5),
    (3, 1),
    (3, 5),
    (4, 1),
    (4, 4),
    (5, 1),
    (5, 2),
    (6, 1),
    (6, 5);

SET session_replication_role = 'origin';