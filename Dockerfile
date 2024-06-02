# Use the official Node.js image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Install Appium globally
RUN npm install -g appium

# Install Appium drivers for UiAutomator2 and XCUITest
RUN appium driver install uiautomator2 && \
    appium driver install xcuitest

# If you want to add another valid driver, uncomment and use the correct driver name
# RUN appium driver install <valid-driver-name>

# Copy the application files
COPY . .

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose the Appium port
EXPOSE 4723

# Run Appium server
CMD ["appium"]
