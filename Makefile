# Variables
TEST_FILE=tests/ts03.robot
OUTPUT_DIR=results

# Default credentials (can be overridden via CLI)
USERNAME ?= 
PASSWORD ?= 

# Default target
.PHONY: all
run-and-open-report: run-parallel open-report

# Run all tests
.PHONY: run-tests
run-tests: prepare-output
	robot --outputdir $(OUTPUT_DIR) --variable username:$(USERNAME) --variable password:$(PASSWORD) $(TEST_FILE)

# Run tests in parallel using pabot
.PHONY: run-parallel
run-parallel: prepare-output
	pabot --processes 4 --testlevelsplit --pabotlib --outputdir $(OUTPUT_DIR) --variable username:$(USERNAME) --variable password:$(PASSWORD) $(TEST_FILE)

# Open report
.PHONY: open-report
open-report:
	@open $(OUTPUT_DIR)/report.html

.PHONY: prepare-output
prepare-output:
	@mkdir -p $(OUTPUT_DIR)


# Clean output
.PHONY: clean
clean:
	rm -rf $(OUTPUT_DIR)/*

# Help
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make run-tests          Run all tests"
	@echo "  make run-parallel       Run tests in parallel with pabot"
	@echo "  make clean              Clean the output directory"
	@echo "  make help               Display this help message"
