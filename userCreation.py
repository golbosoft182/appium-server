import csv
from appium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Function to read data from CSV
def read_user_data(csv_file):
    users = []
    with open(csv_file, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            users.append(row)
    return users

# Appium setup
def setup_appium():
    desired_caps = {
        'platformName': 'Windows',  # or 'Android', 'iOS' depending on the platform
        'browserName': 'Chrome',    # or 'Safari', 'Firefox' depending on the browser
        'deviceName': 'WindowsPC'   # or your device name
    }
    driver = webdriver.Remote('http://104.248.144.73:4723/wd/hub', desired_caps)
    return driver

# Function to register a user
def register_user(driver, user):
    driver.get('https://brainycubs.com/my-account/')

    # Wait for the username field to be present and fill it in
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, 'reg_username'))).send_keys(user['username'])

    # Fill in the email field
    driver.find_element(By.ID, 'reg_email').send_keys(user['email'])

    # Fill in the password field
    driver.find_element(By.ID, 'reg_password').send_keys(user['password'])

    # Click the register button
    driver.find_element(By.NAME, 'register').click()

# Main function
def main():
    csv_file = 'datauser.csv'
    users = read_user_data(csv_file)
    driver = setup_appium()

    try:
        for user in users:
            register_user(driver, user)
            # Wait a few seconds before registering the next user (optional)
            WebDriverWait(driver, 10).until(EC.url_contains('/my-account/'))
    finally:
        driver.quit()

if __name__ == '__main__':
    main()
