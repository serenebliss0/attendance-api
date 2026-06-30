from fastapi import FastAPI
from app.database import get_connection
from app.routers import students

conn = get_connection()


app = FastAPI(
    title="Attendance API",
    version="1.0.0"
)

app.include_router(students.router)

@app.get("/")
def root():
    return {
        "message": "Attendance API is running!"
    }

