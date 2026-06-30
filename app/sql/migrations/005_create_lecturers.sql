CREATE TABLE IF NOT EXISTS lecturers (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    staff_number VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    department_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_lecturers_department
        FOREIGN KEY (department_id)
        REFERENCES departments(id)
);