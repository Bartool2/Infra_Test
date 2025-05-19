from fastapi import FastAPI
import uvicorn # For local testing, not strictly needed in Docker CMD if uvicorn is called directly

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Test. FastAPI app is running on GCP!"}

@app.get("/items/{item_id}")
async def read_item(item_id: int, q: str | None = None):
    return {"item_id": item_id, "q": q}