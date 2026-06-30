CREATE TABLE IF NOT EXISTS class_sessions (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    teaching_assignment_id INTEGER NOT NULL,
    session_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_session_assignment
        FOREIGN KEY (teaching_assignment_id)
        REFERENCES teaching_assignments(id)
);