SELECT * from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name= 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

------transaction queries--------
START TRANSACTION;
UPDATE public.animals SET species = 'unspecified';
SELECT * FROM public.animals;
ROLLBACK TRANSACTION;
-------------------------
START TRANSACTION;
UPDATE public.animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * from public.animals;
UPDATE public.animals SET species = 'pokemon' WHERE species is NULL;
SELECT * from public.animals;
COMMIT TRANSACTION;
SELECT * from public.animals;
----delete transaction----
START TRANSACTION;
DELETE FROM public.animals;
SELECT * FROM public.animals;
ROLLBACK TRANSACTION;
SELECT * FROM public.animals;
----transaction with where clause and savepoint----
START TRANSACTION;
DELETE FROM public.animals WHERE date_of_birth = '2022-01-01';
SAVEPOINT my_first_savepoint;
UPDATE public.animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT my_first_savepoint;
SELECT * FROM public.animals;
UPDATE public.animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM public.animals;
COMMIT TRANSACTION;