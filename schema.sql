CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INT NOT NULL,
	neutered bool,
	weight_kg DECIMAL(6,2),
	species VARCHAR(250)
);
