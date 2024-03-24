from fastapi import FastAPI


app = FastAPI()

@app.get("/api/healthchecker")
def health_check():
    return {"message": "Welcome to FastAPI with SQLAlchemy"}
