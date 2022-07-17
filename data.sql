--insert data into animal's table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, true, 10.23 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '2018-11-15', 2, true, 8 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '2017-05-12', 5, true, 11 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '2020-02-08', 0, false, -11 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon', '2005-06-12', 1, true, -45 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Blossom', '1998-10-13', 3, true, 17 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Ditto', '2022-05-14', 4, true, 22 );

--insert data into owners' table
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

--insert data into species' table
BEGIN;
ALTER SEQUENCE species_id_seq RESTART WITH 1;
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');
COMMIT;


BEGIN;
UPDATE animals
--set species_id for digimon
SET species_id = 1 WHERE name LIKE '%mon%';

UPDATE animals
--set species_id for pokemon
SET species_id = 2 WHERE species_id is NULL;
COMMIT;

BEGIN;
--set sam smith's owner id
UPDATE animals
SET owner_id = 1 WHERE name IN ('Agumon');

--set jennifer orwell's owner id
UPDATE animals
SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');

--set Bob's owner id
UPDATE animals
SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');

--set melody id
UPDATE animals
SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

--set dean id
UPDATE animals
SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
COMMIT;

--insert vet data
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, '2008-06-06');

--insert for specialist
INSERT INTO specializations(vet_id, species_id) VALUES(1, 1);
INSERT INTO specializations(vet_id, species_id) VALUES(3, 1);
INSERT INTO specializations(vet_id, species_id) VALUES(3, 2);
INSERT INTO specializations(vet_id, species_id) VALUES(4, 2); 

--data for visits
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (1, 5, '2020-05-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 5, '2020-07-22');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 6, '2021-02-02');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 9, '2020-01-05');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 9, '2020-03-08');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 9, '2020-05-14');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 7, '2021-05-04');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 3, '2021-02-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 1, '2019-12-21');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (1, 1, '2020-08-10');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 1, '2021-04-07');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 4, '2019-09-29');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 2, '2020-10-03');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 2, '2020-11-04');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2019-01-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2019-05-15');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2020-02-27');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2020-08-03');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 10, '2020-05-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (1, 10, '2021-01-11');