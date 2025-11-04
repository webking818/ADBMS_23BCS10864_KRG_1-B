CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    age INT,
    class INT
);

DO $$
DECLARE
    student_data RECORD;
BEGIN
    FOR student_data IN
        SELECT * FROM (VALUES
            ('Anisha', 16, 8),
            ('Neha', 17, 8),
            ('Mayank', 19, 9),
            ('Anisha', 18, 9)  -- duplicate
        ) AS t(name, age, class)
    LOOP
        BEGIN
            INSERT INTO students(name, age, class)
            VALUES (student_data.name, student_data.age, student_data.class);
            RAISE NOTICE 'Inserted student: %', student_data.name;
        EXCEPTION WHEN unique_violation THEN
            RAISE NOTICE 'Failed to insert student: % (Duplicate Name)', student_data.name;
        WHEN others THEN
            RAISE NOTICE 'Failed to insert student: % (Other Error)', student_data.name;
        END;
    END LOOP;

    RAISE NOTICE 'Transaction completed with individual error handling.';
END;
$$;

SELECT * FROM students;
