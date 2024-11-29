FROM python:3.9.6-alpine3.14

# Set the working directory inside the container
WORKDIR /app

# Copy all the contents of the current directory to the /app directory in the container
COPY . .

# Install dependencies: GCC for compilation, libffi for cryptography, musl for C libraries, FFmpeg for media handling, and aria2 for downloads
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2 \
    && pip install --no-cache-dir -r requirements.txt

# Expose the port for the Gunicorn app (adjust if needed)
EXPOSE 8000

# Run Gunicorn for app and Python script for main logic concurrently
CMD gunicorn app:app --bind 0.0.0.0:8000 & python3 modules/main.py
