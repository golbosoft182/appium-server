# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Install Appium
RUN npm install -g appium

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy the requirements.txt file and install Python dependencies
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Expose the Appium server port
EXPOSE 4723

# Start the Appium server
CMD ["appium"]