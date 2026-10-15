-- UNIDAD 2 | BLOQUE 1
-- Practica SQLBolt: SELECT, FROM y WHERE
-- Lecciones 1 y 2

-- Seleccionar titulos
SELECT title
FROM movies;

-- Seleccionar directores
SELECT director
FROM movies;

-- Seleccionar dos columnas
SELECT director, title
FROM movies;

-- Titulos y anos
SELECT title, year
FROM movies;

-- Todas las columnas
SELECT *
FROM movies;

-- Pelicula con ID 6
SELECT title
FROM movies
WHERE id = 6;

-- Peliculas entre 2000 y 2010
SELECT title
FROM movies
WHERE year BETWEEN 2000 AND 2010;

-- Peliculas fuera del intervalo
SELECT title
FROM movies
WHERE year NOT BETWEEN 2000 AND 2010;

-- Primeras cinco peliculas por ano
SELECT title, year
FROM movies
ORDER BY year ASC
LIMIT 5;

