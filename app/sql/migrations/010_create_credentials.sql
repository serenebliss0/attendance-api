CREATE TABLE IF NOT EXISTS credentials (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    student_id INTEGER NOT NULL,

    credential_type VARCHAR(20) NOT NULL
    CHECK (
        credential_type IN (
            'RFID',
            'NFC',
            'FINGERPRINT',
            'QR'
        )
    ),

    credential_value VARCHAR(255) NOT NULL,

    active BOOLEAN NOT NULL DEFAULT TRUE,

    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_credentials_student
        FOREIGN KEY (student_id)
        REFERENCES students(id),

    CONSTRAINT uq_credential
        UNIQUE (
            credential_type,
            credential_value
        )
);