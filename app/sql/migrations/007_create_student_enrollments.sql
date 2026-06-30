CREATE TABLE IF NOT EXISTS enrollments (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    student_id INTEGER NOT NULL,

    course_id INTEGER NOT NULL,

    academic_year VARCHAR(20) NOT NULL,

    semester INTEGER NOT NULL,

    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    status VARCHAR(20) NOT NULL DEFAULT 'Enrolled',

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES students(id),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES courses(id),

    CONSTRAINT uq_enrollment
        UNIQUE (
            student_id,
            course_id,
            academic_year,
            semester
        )
);