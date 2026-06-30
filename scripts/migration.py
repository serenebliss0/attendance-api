
#TODO
# Found migration: 001_create_students.sql
# Found migration: 002_create_courses.sql

# Connecting to database...

# Running 001_create_students.sql...
# ✓ Success

# Running 002_create_courses.sql...
# ✓ Success

# All migrations complete.

from dotenv import load_dotenv
import os
import psycopg
from pathlib import Path


migration_folder = Path("app/sql/migrations")

load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")

print(DATABASE_URL)

connection = psycopg.connect(DATABASE_URL)

cursor = connection.cursor()

cursor.execute("SELECT version();")
result = cursor.fetchone()
print(result)

cursor.execute("""
CREATE TABLE IF NOT EXISTS migrations (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    filename VARCHAR(255) UNIQUE NOT NULL,

    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
""")

connection.commit()

migration_files = sorted(migration_folder.glob("*.sql"))

for file in migration_files:
    print(file.name)


cursor.execute("""
SELECT filename
FROM migrations;
""")

applied_migrations = {
    row[0] for row in cursor.fetchall()
}

print(applied_migrations)

for migration in migration_files:
    
    if migration.name in applied_migrations:
        print(f"Skipping {migration.name}")
        continue

    print(f"Running {migration.name}")
    sql = migration.read_text()

    try:
        cursor.execute(sql)

        cursor.execute(
            """
            INSERT INTO migrations(filename)
            VALUES (%s);
            """,
            (migration.name,)
        )

        connection.commit()

    except Exception:
        connection.rollback()
        raise

print("\nAll migrations completed!")

cursor.close()
connection.close()

# TODO later
# 001_create_students.sql          ✅
# 002_create_courses.sql           ✅
# 003_create_departments.sql
# 004_create_lecturers.sql
# 005_create_student_courses.sql
# 006_create_class_sessions.sql
# 007_create_attendance.sql
# 008_create_fingerprints.sql