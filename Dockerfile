# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Remove existing Yarn installation if any
RUN rm -rf /usr/local/bin/yarn /usr/local/bin/yarnpkg /usr/local/lib/node_modules/yarn

# Install Yarn
RUN npm install -g yarn

# Install Appium using Yarn
RUN yarn global add appium

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
CMD ["appium", "--address", "0.0.0.0", "--port", "4723", "--base-path", "/wd/hub"]
