-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Drop existing tables if they exist
DROP TABLE IF EXISTS Results;
DROP TABLE IF EXISTS Predictions;
DROP TABLE IF EXISTS Drivers;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Races;

-- Create Drivers table
CREATE TABLE Drivers (
    driver_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    nationality TEXT NOT NULL,
    team_id INTEGER,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Create Teams table
CREATE TABLE Teams (
    team_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    headquarters TEXT
);

-- Create Races table
CREATE TABLE Races (
    race_id INTEGER PRIMARY KEY,
    location TEXT NOT NULL,
    date DATE NOT NULL
);

-- Create Results table
CREATE TABLE Results (
    result_id INTEGER PRIMARY KEY,
    race_id INTEGER,
    driver_id INTEGER,
    position INTEGER,
    points INTEGER,
    FOREIGN KEY (race_id) REFERENCES Races(race_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Create Predictions table
CREATE TABLE Predictions (
    prediction_id INTEGER PRIMARY KEY,
    race_id INTEGER,
    driver_id INTEGER,
    predicted_position INTEGER,
    FOREIGN KEY (race_id) REFERENCES Races(race_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);
