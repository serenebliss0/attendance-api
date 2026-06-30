CREATE TABLE IF NOT EXISTS teaching_assignments (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lecturer_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    academic_year VARCHAR(20) NOT NULL,
    semester INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_assignment_lecturer
        FOREIGN KEY (lecturer_id)
        REFERENCES lecturers(id),

    CONSTRAINT fk_assignment_course
        FOREIGN KEY (course_id)
        REFERENCES courses(id),

    CONSTRAINT uq_assignment
        UNIQUE (
            lecturer_id,
            course_id,
            academic_year,
            semester
        )
);