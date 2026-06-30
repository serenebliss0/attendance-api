CREATE TABLE IF NOT EXISTS attendance (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    enrollment_id INTEGER NOT NULL,
    class_session_id INTEGER NOT NULL,
    check_in_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_attendance_enrollment
        FOREIGN KEY (enrollment_id)
        REFERENCES enrollments(id),

    CONSTRAINT fk_attendance_session
        FOREIGN KEY (class_session_id)
        REFERENCES class_sessions(id),

    CONSTRAINT uq_attendance
        UNIQUE (
            enrollment_id,
            class_session_id
        )
);