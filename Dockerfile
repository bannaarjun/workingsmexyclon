FROM python:3.9.6-alpine3.14

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install required packages and dependencies
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2 && \
    pip install --no-cache-dir -r requirements.txt

# Run both gunicorn and python3 main.py using a shell command
CMD gunicorn app:app & python3 /app/main.py
