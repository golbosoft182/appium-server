# appium-server
Appium Serverz

# Steps to Build and Run the Docker Container
# Ensure no running or exited containers from previous attempts:
docker ps -a
docker rm <container_id>  # Remove any existing containers

# Build the Docker image:
docker build -t appium-python .

# Run the Docker container:
docker run -p 4723:4723 -v $(pwd):/usr/src/app appium-python

# Run a shell inside the container:
docker exec -it <container_id> /bin/bash

# List installed drivers:
appium driver list --installed

# List installed plugins:
appium plugin list --installed