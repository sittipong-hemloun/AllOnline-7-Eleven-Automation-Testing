# AllOnline 7-Eleven Automation Testing Suite

This repository contains a sample test automation project for the AllOnline 7-Eleven website. The project is built using the Robot Framework and includes the following features:

![alt text](image.png)

## Project Structure

```
/test03
├── resources
├── tests
│   └── ts03.robot
├── results
│   └── pabot_results
├── Makefile
└── requirements.txt
```

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

## Test Framework

This project leverages the following libraries:

- [Robot Framework](https://robotframework.org/): Core test framework.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/): For web browser automation.
- [DataDriver](https://github.com/Snooz82/robotframework-datadriver): Enables data-driven testing.
- [Pabot](https://github.com/mkorpela/pabot): Parallel test execution.
