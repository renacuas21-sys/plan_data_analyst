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

-- ==========================================
-- UNIDAD 2 - BLOQUE 1
-- Practica SQLBolt - 15 de octubre de 2026
-- Leccion 3: LIKE y NOT LIKE
-- Leccion 4: DISTINCT, ORDER BY, LIMIT y OFFSET
-- Review 1: Consultas de repaso
-- ==========================================

-- Buscar peliculas cuyo titulo comienza con Toy
SELECT title
FROM movies
WHERE title LIKE 'Toy%';

-- Buscar peliculas cuyo titulo NO comienza con Toy
SELECT title
FROM movies
WHERE title NOT LIKE 'Toy%';

-- Mostrar los años sin repetirlos
SELECT DISTINCT year
FROM movies;

-- Mostrar los años sin repetir, del más reciente al más antiguo
SELECT DISTINCT year
FROM movies
ORDER BY year DESC;

-- Mostrar solamente las 5 películas más recientes
SELECT title, year
FROM movies
ORDER BY year DESC
LIMIT 5;


