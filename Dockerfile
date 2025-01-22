FROM ubuntu:latest

# Update package manager and install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv

# Set the working directory
WORKDIR /app

# Copy application files to the container
COPY app.py /app

# Install Flask (explicitly bypass restrictions)
RUN pip3 install --break-system-packages flask

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Expose the Flask default port
EXPOSE 5000

# Define the command to run the app
CMD ["flask", "run", "--host=0.0.0.0"]
