# 1. Use an official, lightweight Python environment
FROM python:3.10-slim

# 2. Set the working directory inside the container to /app
WORKDIR /app

# 3. Copy just the requirements file first to take advantage of Docker caching
COPY requirements.txt .

# 4. Install dependencies from the text file
RUN pip --default-timeout=1000 install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code (main.py)
COPY main.py .

# 6. The command that runs your app using Uvicorn when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]