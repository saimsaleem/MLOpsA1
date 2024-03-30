# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code into the container
COPY . /app

# Run your build and test commands (replace with your actual commands)
RUN python -m unittest test.py

# Expose the port your application runs on (if applicable)
EXPOSE 8000

# Command to run the application (replace with your actual command)
CMD [ "python", "./app.py" ]
