CREATE TABLE actor (
    id smallint NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL
);

ALTER TABLE actor ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE actor_movie (
    actor_id smallint NOT NULL,
    movie_id smallint NOT NULL
);

CREATE TABLE director (
    id smallint NOT NULL,
    first_name character varying(64),
    last_name character varying
);

ALTER TABLE director ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME director_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE genre (
    id smallint NOT NULL,
    name character varying(32) NOT NULL
);

ALTER TABLE genre ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE genre_movie (
    movie_id smallint NOT NULL,
    genre_id smallint NOT NULL
);

CREATE TABLE movie (
    id smallint NOT NULL,
    name character varying NOT NULL,
    director_id smallint NOT NULL,
    release_year smallint NOT NULL
);

ALTER TABLE movie ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE actor_movie
    ADD CONSTRAINT actor_movie_pkey PRIMARY KEY (actor_id, movie_id);

ALTER TABLE actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);

ALTER TABLE director
    ADD CONSTRAINT director_pkey PRIMARY KEY (id);

ALTER TABLE genre_movie
    ADD CONSTRAINT genre_movie_pkey PRIMARY KEY (movie_id, genre_id);

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


CREATE INDEX "fki_fk-actor_movie-to-movie" ON actor_movie USING btree (movie_id);

CREATE INDEX "fki_fk-to-actor" ON actor_movie USING btree (actor_id);

CREATE INDEX "fki_fk-to-director" ON movie USING btree (director_id);

CREATE INDEX "fki_fk-to-genre" ON genre_movie USING btree (genre_id);

CREATE INDEX "fki_fk-to-movie" ON genre_movie USING btree (movie_id);


ALTER TABLE ONLY actor_movie
    ADD CONSTRAINT "fk-actor_movie-to-movie" FOREIGN KEY (movie_id) REFERENCES movie(id) ON UPDATE CASCADE NOT VALID;

ALTER TABLE ONLY actor_movie
    ADD CONSTRAINT "fk-to-actor" FOREIGN KEY (actor_id) REFERENCES actor(id) ON UPDATE CASCADE NOT VALID;

ALTER TABLE ONLY movie
    ADD CONSTRAINT "fk-to-director" FOREIGN KEY (director_id) REFERENCES director(id) ON UPDATE CASCADE NOT VALID;

ALTER TABLE ONLY genre_movie
    ADD CONSTRAINT "fk-to-genre" FOREIGN KEY (genre_id) REFERENCES genre(id) ON UPDATE CASCADE NOT VALID;

ALTER TABLE ONLY genre_movie
    ADD CONSTRAINT "fk-to-movie" FOREIGN KEY (movie_id) REFERENCES movie(id) ON UPDATE CASCADE NOT VALID;

ALTER TABLE ONLY actor_movie
    ADD CONSTRAINT "fk-to-movie" FOREIGN KEY (movie_id) REFERENCES movie(id) ON UPDATE CASCADE NOT VALID;

