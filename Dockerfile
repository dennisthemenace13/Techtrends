# Use a Python base image in version 3.8
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /techtrends

# Copy the current directory contents into the container at /app
COPY . /techtrends

# Install packages defined in the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 3111

# Ensure that the database is initialized with the pre-defined posts
RUN python init_db.py

# Define the command to run the application
CMD ["python", "app.py"]
