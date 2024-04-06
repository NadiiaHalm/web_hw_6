CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(200) NOT NULL
);

CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname VARCHAR(150) NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(id)
);


CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE subjects (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     name VARCHAR(150) NOT NULL,
     teacher_id INTEGER,
     FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
     student_id INT,
     subject_id INT,
     grade FLOAT,
     date_received DATE,
     FOREIGN KEY (student_id) REFERENCES students(id),
     FOREIGN KEY (subject_id) REFERENCES subjects(id)
);
