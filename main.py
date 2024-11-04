from fastapi import FastAPI
from pydantic import BaseModel

SECRET = "super_secret"

app = FastAPI()

class AuthCodeRequest(BaseModel):
    code: str
    secret: str

@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

@app.post("/auth-code")
def receive_auth_code(request: AuthCodeRequest):
    if request.secret != SECRET:
        return {
            "status": "Error",
            "message": "Invalid secret"
        }

    with open("auth_code.txt", "w") as file:
        file.write(request.code)

    return {
        "status": "Success",
        "message": "Auth code and secret saved to file"
    }
