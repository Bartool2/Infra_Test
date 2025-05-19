FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Make port 8080 available to the world outside this container
# Cloud Run expects your application to listen on the port defined by the PORT environment variable,
# which defaults to 8080.
EXPOSE 8080

# Define environment variable
ENV PORT 8080

# Run app.py when the container launches
# Uvicorn will listen on the $PORT environment variable.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]