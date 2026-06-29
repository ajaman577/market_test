# 1. Use an official, lightweight Python environment
FROM python:3.10-slim

# 2. Set the working directory inside the container to /app
WORKDIR /app

# 3. Install FastAPI and Uvicorn directly inside the container
RUN pip --default-timeout=1000 install --no-cache-dir fastapi uvicorn

# 4. Copy your local main.py file into the container's /app folder
COPY main.py .

# 5. Tell the container to open up port 8000 to the outside world
EXPOSE 8000

# 6. The command that runs your app using Uvicorn when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]