import sqlite3


def select(query_number):
    with open(f'query_{query_number}.sql', 'r') as f:
        sql = f.read()

    with sqlite3.connect('collage.db') as conn:
        cur = conn.cursor()
        cur.execute(sql)
        return cur.fetchall()


if __name__ == "__main__":
    print(select(1))
