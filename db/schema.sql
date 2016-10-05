DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS songs;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  photo_url VARCHAR,
  nationality VARCHAR
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  album TEXT NOT NULL,
  preview_url TEXT,
  artist_id INT NOT NULL
);
