import re
from fastapi import FastAPI
from pydantic import BaseModel

SECRET = "super_secret"
AUTH_CODE_FILEPATH = "./ahk/auth_code.txt"

app = FastAPI()

class AuthCodeRequest(BaseModel):
    sms: str
    secret: str

@app.get("/")
def read_root():
    return {
        "message": "Hello, World!"
    }

@app.post("/auth-code")
def receive_auth_code(request: AuthCodeRequest):
    if request.secret != SECRET:
        return {
            "status": "Error",
            "message": "Invalid secret"
        }

    auth_code = re.search(r'\b\d+\b', request.sms).group()

    with open(AUTH_CODE_FILEPATH, "w") as file:
        file.write(auth_code)

    return {
        "status": "Success",
        "message": "Auth code and secret saved to file"
    }
