# AllOnline 7-Eleven Automation Testing Suite

This repository contains a sample test automation project for the AllOnline 7-Eleven website. The project is built using the Robot Framework and supports efficient, automated testing of web-based user flows.

![alt text](image.png)

## Features

- Automated end-to-end tests for critical workflows (e.g., login, product search, checkout).
- Parallel test execution using Pabot for faster results.
- Data-driven testing enabled by DataDriver.
- Comprehensive test reports with detailed logs.

## Project Structure

```
/project
├── resources
│   ├── authentication
│   ├── commons
│   ├── home
│   ├── payment
│   └── shipping
├── tests
│   └── ts03.robot
├── results
│   └── pabot_results
├── Makefile
└── requirements.txt
```

## Setup

### Prerequisites

1. **Python 3.13 or later:** Ensure Python is installed and accessible in your system PATH.
2. **Install dependencies:** Install the required Python packages listed in `requirements.txt`.

   ```bash
   pip install -r requirements.txt
   ```

3. **Browser Drivers:** Install the appropriate browser drivers (e.g., ChromeDriver) and ensure they are in your system PATH.

### Virtual Environment (Recommended)

To avoid conflicts between dependencies, set up a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate   # On Windows: .venv\Scripts\activate
```

## Running Tests

### Running and Opening the Report

Run the tests and open the generated report:

```bash
make run-and-open-report USERNAME=your_email@example.com PASSWORD=YourSecurePassword
```

### Running Tests in Parallel

Execute tests in parallel for faster results:

```bash
make run-parallel USERNAME=your_email@example.com PASSWORD=YourSecurePassword
```

### Cleaning Test Outputs

Clean up test results to prepare for a new run:

```bash
make clean
```
