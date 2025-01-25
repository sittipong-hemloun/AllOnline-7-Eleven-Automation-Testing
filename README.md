# Login Automation

This automates the login functionality testing. It supports both positive and negative test cases for login scenarios and includes data-driven testing using CSV files.

## Project Structure

```
/test03
├── resources
│   ├── commons
│   │   └── browser.resource
│   └── authentication
│       ├── login_keywords.resource
│       └── login_locators.resource
├── tests
│   └── login.robot
├── data
│   └── login_testcase.csv
├── results
│   └── pabot_results
├── Makefile
└── requirements.txt
```

### Key Directories and Files

- **resources/commons/browser.resource**: Contains browser-related keywords for opening and navigating.
- **resources/authentication/login_keywords.resource**: Contains reusable keywords specific to login functionality.
- **resources/authentication/login_locators.resource**: Stores locators for the login page elements.
- **tests/login.robot**: Test suite for login functionality.
- **data/login_testcase.csv**: Data file for data-driven testing.
- **Makefile**: Contains commands to run tests, clean outputs, and more.
- **requirements.txt**: Lists the dependencies for the project.

## Setup

### Prerequisites

1. Python 3.13 or later.
2. Install the required Python dependencies listed in `requirements.txt`.

```bash
pip install -r requirements.txt
```

3. Ensure the browser drivers (e.g., ChromeDriver) are installed and added to your system PATH.

### Virtual Environment (Optional)

Set up a virtual environment to manage dependencies:

```bash
python -m venv .venv
source .venv/bin/activate   # On Windows: .venv\Scripts\activate
```

## Running Tests

### Running And Opening Report

```bash
make run-and-open-report
```

### Running Tests in Parallel

```bash
make run-parallel
```

### Cleaning Test Outputs

```bash
make clean
```

## Test Data

The `data/login_testcase.csv` file contains the test cases in a tabular format. Each row includes the username, password, expected message, tags, and documentation:

```csv
*** Test Cases ***,${username},${password},${expected_message},[Tags],[Documentation]
Login success,tomsmith,SuperSecretPassword!,You logged into a secure area!,"positive,smoke",To verify that a user can login successfully when they put a correct username and password.
Login failed - Password incorrect,tomsmith,Password!,Your password is invalid!,"negative,smoke",To verify that a user cannot login with a correct username but wrong password.
Login failed - Username not found,tomholland,SuperSecretPassword!,Your username is invalid!,"negative,smoke",To verify that a user cannot login with a non-existent username.
```

## Test Framework

This project leverages the following libraries:

- [Robot Framework](https://robotframework.org/): Core test framework.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/): For web browser automation.
- [DataDriver](https://github.com/Snooz82/robotframework-datadriver): Enables data-driven testing.
- [Pabot](https://github.com/mkorpela/pabot): Parallel test execution.
