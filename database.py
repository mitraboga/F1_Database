import sqlite3

# Connect to the database
conn = sqlite3.connect('f1_database.db')
cursor = conn.cursor()

# Read the schema.sql file
with open('schema.sql', 'r') as file:
    schema = file.read()

# Execute the schema
cursor.executescript(schema)

# Sample data insertion (optional)
# Insert some data to test the schema
cursor.executescript('''
INSERT INTO Teams (name, headquarters) VALUES ('Team A', 'Headquarters A');
INSERT INTO Drivers (name, nationality, team_id) VALUES ('Driver 1', 'Country 1', 1);
INSERT INTO Races (location, date) VALUES ('Location 1', '2024-07-01');
INSERT INTO Results (race_id, driver_id, position, points) VALUES (1, 1, 1, 25);
INSERT INTO Predictions (race_id, driver_id, predicted_position) VALUES (1, 1, 1);
''')

# Commit changes and close the connection
conn.commit()
conn.close()
