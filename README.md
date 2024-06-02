## appium-server
Appium Server

### Steps to Build and Run the Docker Container
### Ensure no running or exited containers from previous attempts:
```
docker ps -a
```

### Remove any existing containers
```
docker rm <container_id>
```

### Build the Docker image:
```
docker build -t appium-python .
```

### Run the Docker container:
```
docker run -p 4723:4723 -v $(pwd):/usr/src/app appium-python
```

### Run a shell inside the container:
```
docker exec -it <container_id> /bin/bash
```

### List installed drivers:
```
appium driver list --installed
```

### List installed plugins:
```
appium plugin list --installed
```