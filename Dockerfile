FROM python:3.9.6-alpine3.14

WORKDIR /app

COPY . .
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2 && pip install --no-cache-dir -r requirements.txt

CMD gunicorn moduls:module & python3 main.py
