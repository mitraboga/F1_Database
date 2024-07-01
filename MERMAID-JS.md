```mermaid
erDiagram
    DRIVERS {
        int driver_id PK
        varchar name
        varchar nationality
        int team_id FK
    }
    TEAMS {
        int team_id PK
        varchar name
        varchar headquarters
    }
    RACES {
        int race_id PK
        varchar location
        date date
    }
    RESULTS {
        int result_id PK
        int race_id FK
        int driver_id FK
        int position
        int points
    }
    PREDICTIONS {
        int prediction_id PK
        int race_id FK
        int driver_id FK
        int predicted_position
    }

    DRIVERS }|..|| TEAMS : "belongs to"
    TEAMS ||--o{ DRIVERS : "has"
    RACES ||--o{ RESULTS : "has"
    DRIVERS ||--o{ RESULTS : "participates in"
    RACES ||--o{ PREDICTIONS : "has"
    DRIVERS ||--o{ PREDICTIONS : "can have"
