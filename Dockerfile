# Use an official Python runtime as a parent image.
# python:3.10-slim is a good choice for production as it's smaller.
FROM python:3.13.5-alpine3.22

# Set the working directory in the container.
WORKDIR /app

# Copy the dependencies file to the working directory.
COPY requirements.txt .

# Install any needed packages specified in requirements.txt.
# --no-cache-dir reduces the image size.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code to the working directory.
COPY . .

# Make port 8000 available to the world outside this container.
EXPOSE 8000

# Run the application with Uvicorn.
# Use 0.0.0.0 to make it accessible from outside the container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]