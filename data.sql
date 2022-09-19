INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Devimon', '2017-05-12', 5, true, 11);
	-----------------------insert new data------
	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Squirtle', '2021-04-02', 3, false, -12.13);
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Ditto', '2022-05-14', 4, true, 22);

	----insert into the owners table-------------------------
	INSERT INTO public.owners(
	full_name, age)
	VALUES ('Sam Smith',34 ),('Jennifer Orwell',19 ),('Bob',45 ),('Melody Pond',77 ),('Dean Winchester',14 ),('Jodie Whittaker',38 );
	---------------insert data into species table---------------
	INSERT INTO public.species(
	name)
	VALUES ('Pokemon'),('Digimon');
	------------modify animals to include species_id --------------
	UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
------------Modify inserted animals to include owner information (owner_id)----
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

---------inset data for vets-----------------------------------------------------

INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('William Tatcher', 45, '2000-04-23'),
	('Maisy Smith', 26, '2019-01-17'),
	('Stephanie Mendez', 64, '1981-05-04'),
	('Jack Harkness', 38, '2008-06-08');

	---------------------insert data for specializations--------------------------

	INSERT INTO public.specializations(
	species_id, vets_id)
	VALUES (1, 1),
	(1, 3),
	(2, 3),
	(2, 4);
	-------------------insert data into the visits table---------------------------------
	INSERT INTO public.visits(
	animal_id, vets_id, visit_date)
	VALUES (12, 1, '2020-05-24'),
	(12, 3, '2020-07-22'),
	(13, 4, '2021-02-02'),
	(14, 2, '2020-01-05'),
	(14, 2, '2020-03-08'),
	(14, 2, '2020-05-14'),
	(15, 3, '2021-05-04'),
	(16, 4, '2021-02-24'),
	(17, 2, '2019-12-21'),
	(17, 1, '2020-08-10'),
	(17, 2, '2021-04-07'),
	(18, 3, '2019-09-29'),
	(19, 4, '2020-10-03'),
	(19, 4, '2020-11-04'),
	(20, 2, '2019-01-24'),
	(20, 2, '2019-05-15'),
	(20, 2, '2020-02-27'),
	(20, 2, '2020-08-03'),
	(21, 3, '2020-05-24'),
	(21, 1, '2021-01-11');
------------query plan and indexing---------------
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

