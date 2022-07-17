--create animal table
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INT NOT NULL,
	neutered bool,
	weight_kg DECIMAL(6,2)
);

--create owners table
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	full_name VARCHAR(250) NOT NULL,
	age INT
);

--create species table
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(250) NOT NULL
);

--Add foreign keys to animal table
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals ADD COLUMN species_id int REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id int REFERENCES owners(id);

--vets table
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE
);

--specialization join table
CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    vet_id integer REFERENCES vets(id),
    species_id integer REFERENCES species(id)
);

--visits join table
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_id integer REFERENCES animals(id),
    vet_id integer REFERENCES vets(id),
    date date
);