SELECT * from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name= 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

------transaction, savepoint queries--------
START TRANSACTION;
UPDATE public.animals SET species = 'unspecified';
SELECT * FROM public.animals;
ROLLBACK TRANSACTION;

START TRANSACTION;
UPDATE public.animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * from public.animals;
UPDATE public.animals SET species = 'pokemon' WHERE species is NULL;
SELECT * from public.animals;
COMMIT TRANSACTION;
SELECT * from public.animals;

START TRANSACTION;
DELETE FROM public.animals;
SELECT * FROM public.animals;
ROLLBACK TRANSACTION;
SELECT * FROM public.animals;

START TRANSACTION;
DELETE FROM public.animals WHERE date_of_birth = '2022-01-01';
SAVEPOINT my_first_savepoint;
UPDATE public.animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT my_first_savepoint;
SELECT * FROM public.animals;
UPDATE public.animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM public.animals;
COMMIT TRANSACTION;

-----sql queries for the questions------

SELECT count(*) as number_of_animals FROM public.animals;
SELECT count(*) as  never_tried_to_escape FROM public.animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) as average_weight FROM public.animals;
SELECT max(escape_attempts) as escape_attempts, neutered from public.animals GROUP BY neutered;
SELECT min(weight_kg) as min_age, max(weight_kg) as max_age, neutered FROM public.animals GROUP BY neutered;
SELECT avg(escape_attempts) as avg_escape_attempt, neutered FROM public.animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY neutered;

-------SQL Queris using joins-------------------------------------------------------
select name as aimals_owned_by_Melody_Pond from animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Melody Pond';
select A.name as pokemon_animals from animals A JOIN species S ON A.species_id = S.id WHERE S.name = 'Pokemon';
select A.name as animal_names, O.full_name as owners from animals A RIGHT JOIN owners O ON A.owner_id = O.id;
select count(S.name) as number_of_animals, S.name as species  from animals A JOIN species S ON A.species_id = S.id GROUP BY S.name;
SELECT A.name as Digimon_Animals, O.full_name as owned_by from animals A JOIN owners O ON A.owner_id = O.id JOIN species S ON A.species_id = S.id where S.name = 'Digimon' AND O.full_name = 'Jennifer Orwell';
select A.name as animal_names from animals A JOIN owners O ON A.owner_id = O.id where O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;
select count(A.owner_id) as number_of_owned_animals, O.full_name as owner_name from owners O JOIN animals A ON A.owner_id = O.id GROUP BY O.full_name;


