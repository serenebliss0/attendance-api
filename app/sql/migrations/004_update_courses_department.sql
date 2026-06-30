ALTER TABLE courses
ADD COLUMN department_id INTEGER;

ALTER TABLE courses
ADD CONSTRAINT fk_courses_department
FOREIGN KEY (department_id)
REFERENCES departments(id);