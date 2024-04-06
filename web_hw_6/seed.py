import sqlite3
from random import randint

from faker import Faker

fake = Faker('uk_UA')


def generate_fake_data():
    groups = [(fake.word(),) for _ in range(3)]
    students = [(fake.name(), randint(1, 3)) for _ in range(30)]
    teachers = [(fake.name(),) for _ in range(5)]
    subjects = [(fake.catch_phrase(), randint(1, 5)) for _ in range(5)]

    return students, subjects, groups, teachers


def insert_data(students, subjects, groups, teachers):
    with sqlite3.connect('collage.db') as conn:
        cur = conn.cursor()
        cur.executemany('INSERT INTO students (fullname, group_id) VALUES (?, ?)', students)
        cur.executemany('INSERT INTO subjects (name, teacher_id) VALUES (?, ?)', subjects)
        cur.executemany('INSERT INTO groups (name) VALUES (?)', groups)
        cur.executemany('INSERT INTO teachers (name) VALUES (?)', teachers)
        for student_id in range(1, 31):
            for subject_id in range(1, 6):
                grade = randint(1, 10)
                date_received = fake.date_this_decade()
                cur.execute('INSERT INTO Grades (student_id, subject_id, grade, date_received) VALUES (?, ?, ?, ?)',
                            (student_id, subject_id, grade, date_received))
        conn.commit()


if __name__ == "__main__":
    students, subjects, groups, teachers = generate_fake_data()
    insert_data(students, subjects, groups, teachers)
