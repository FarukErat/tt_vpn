FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY main.py /app/main.py

COPY server.crt /app/server.crt

COPY server.key /app/server.key

RUN mkdir /app/ahk

EXPOSE 8421

CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "main:app", "-b", "0.0.0.0:8421", "--certfile=server.crt", "--keyfile=server.key"]
