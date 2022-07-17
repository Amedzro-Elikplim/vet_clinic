SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered IN (true) AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IN (true);
SELECT * FROM animals WHERE name NOT IN('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

--set species column to unspecified and roll back
BEGIN;
UPDATE animals
SET species = 'unspecified'
ROLLBACK;

--Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon%';

--Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

--Delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
--Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
--create a savepoing
SAVEPOINT SP1;
--Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
--Rollback to the savepoint
ROLLBACK TO SP1;
--Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 
WHERE weight_kg < 0;
COMMIT;

--How many animals are there?
SELECT COUNT(name) FROM animals;

--How many animals have never tried to escape?
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;

--What is the average weight of animals?
SELECT ROUND(AVG(weight_kg), 2) FROM animals;

--Who escapes the most, neutered or not neutered animals?
SELECT max(escape_attempts) from animals;
SELECT name FROM animals WHERE escape_attempts = 7;

--What is the minimum and maximum weight of each type of animal?
SELECT min(weight_kg), max(weight_kg) FROM animals group by species;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT ROUND(AVG(escape_attempts), 2) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

--what animal belong to melody
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners RIGHT JOIN animals
ON owners.id = animals.owner_id;

--How many animals are there per species?
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id
GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species
ON animals.species_id = species.id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals?
SELECT owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name ORDER BY COUNT(owner_id) DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC;

--How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) FROM animals JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

--List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez'
AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

--What animal has the most visits to vets?
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name ORDER BY COUNT(visits.animal_id) DESC
LIMIT 1;

--Who was Maisy Smith's first visit?
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC LIMIT 1;

--Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.*, vets.*, visits.date_of_visit FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM Visits
JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.ID
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON specializations.species_id = species.id
WHERE animals.species_id NOT IN (
  SELECT specializations.species_id FROM vets
JOIN specializations ON vets.id = specializations.vet_id
WHERE vets.id = visits.vet_id
);

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(species.name) FROM vets JOIN visits ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith' GROUP BY species.name
LIMIT 1;
