from fastapi import APIRouter

from app.database import get_connection

router = APIRouter(
    prefix="/students",
    tags=["Students"]
)


@router.get("/")
def get_students():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT
            id,
            matric_number,
            first_name,
            last_name,
            email
        FROM students
        ORDER BY last_name;
    """)

    rows = cursor.fetchall()

    students = []

    for row in rows:
        students.append({
            "id": row[0],
            "matric_number": row[1],
            "first_name": row[2],
            "last_name": row[3],
            "email": row[4]
        })


    cursor.close()
    conn.close()

    return students