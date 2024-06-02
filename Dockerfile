# Use the official Node.js image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Install Appium globally
RUN npm install -g appium

# Install Appium drivers for UiAutomator2 and XCUITest
RUN appium driver install uiautomator2 && \
    appium driver install xcuitest

# Install Appium plugins
RUN appium plugin install images && \
    appium plugin install element-wait

# Copy the application files
COPY . .

# Install Python 3.8 and pip
RUN apt-get update && \
    apt-get install -y python3.8 python3.8-distutils && \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.8

# Install Python dependencies
RUN python3.8 -m pip install -r requirements.txt

# Expose the Appium port
EXPOSE 4723

# Run Appium server with base path /wd/hub and use installed plugins
CMD ["appium", "--base-path", "/wd/hub", "--use-plugins", "images,element-wait"]
