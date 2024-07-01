-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Insert sample data into Teams
INSERT INTO Teams (team_id, name, headquarters) VALUES
(1, 'Mercedes', 'Brackley, United Kingdom'),
(2, 'Red Bull Racing', 'Milton Keynes, United Kingdom'),
(3, 'Ferrari', 'Maranello, Italy');

-- Insert sample data into Drivers
INSERT INTO Drivers (driver_id, name, nationality, team_id) VALUES
(1, 'Lewis Hamilton', 'British', 1),
(2, 'Max Verstappen', 'Dutch', 2),
(3, 'Charles Leclerc', 'Monégasque', 3);

-- Insert sample data into Races
INSERT INTO Races (race_id, location, date) VALUES
(1, 'Monaco', '2024-05-26'),
(2, 'Silverstone', '2024-07-14'),
(3, 'Monza', '2024-09-08');

-- Insert sample data into Results
INSERT INTO Results (result_id, race_id, driver_id, position, points) VALUES
(1, 1, 1, 1, 25),
(2, 1, 2, 2, 18),
(3, 1, 3, 3, 15),
(4, 2, 2, 1, 25),
(5, 2, 3, 2, 18),
(6, 2, 1, 3, 15);

-- Insert sample data into Predictions
INSERT INTO Predictions (prediction_id, race_id, driver_id, predicted_position) VALUES
(1, 3, 1, 1),
(2, 3, 2, 2),
(3, 3, 3, 3);

-- Queries
-- Get all race results
SELECT * FROM Results;

-- Get the standings of all drivers
SELECT driver_id, SUM(points) as total_points
FROM Results
GROUP BY driver_id
ORDER BY total_points DESC;

-- Get predictions for the next race
SELECT * FROM Predictions WHERE race_id = 3;

-- Compare predictions with actual results (for races with results)
SELECT p.race_id, p.driver_id, p.predicted_position, r.position
FROM Predictions p
JOIN Results r ON p.race_id = r.race_id AND p.driver_id = r.driver_id;
