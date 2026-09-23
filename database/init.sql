-- Recycle Right Database Schema:

-- Users table:
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	password TEXT NOT NULL,
	role VARCHAR(10) DEFAULT 'user'
);

-- Waste items:
CREATE TABLE waste_items(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	category VARCHAR(100) NOT NULL,
	subcategory VARCHAR(100),
	recyclable BOOLEAN DEFAULT FALSE,
	disposal TEXT
);

-- User-submitted suggestions:
CREATE TABLE suggestions(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	category VARCHAR(50) NOT NULL, 
	subcategory VARCHAR(50),
	recyclable BOOLEAN DEFAULT FALSE,
	disposal VARCHAR(255),
	submitted_by VARCHAR(100) NOT NULL,
	status VARCHAR(10) DEFAULT 'PENDING'
);

-- Disposal centers:
CREATE TABLE disposal_centers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	address TEXT,
	latitude NUMERIC(10, 7) NOT NULL,
	longitude NUMERIC (10, 7) NOT NULL,
	contact VARCHAR(50),
	website_url TEXT,
	category VARCHAR(50)
);
