#!/bin/bash
# Author: Samir Ranjan Parhi
# License: Same as Repository Licence
# Usage : Beta-Release
set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)

echo -e "\n ${BOLD}${RED}Important !${RESET} This script Assumes that you alreday have the sonar Cli (sonar-scanner) installed and you are currently inside the project directory !!!"

# Set the path to your SonarQube server

SONAR_SERVER_URL="http://localhost:9000"

echo -e "\n ${BLUE}The Sonar Server URL is currently set to  $SONAR_SERVER_URL. You can change it to your server URL any time. (feature: WIP)${RESET}"

# Set the project key and name

echo -e "\n ${BLUE}Please input your Project key:${RESET}"

read projectKey

PROJECT_KEY=${projectKey}

echo -e "\n ${BLUE}Please input your Project Name:${RESET}"

read projectName

PROJECT_NAME=${projectName}

# Set the path to your project source code

echo -e "\n ${BLUE}Please input the Directory you want to scan:${RESET}"

read projectDir

PROJECT_SOURCE_DIR="${projectDir}"

# Set other optional parameters as needed
# For example, you can specify the language, exclude files, etc.
# See SonarScanner documentation for more options: https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/

# Run SonarScanner
sonar-scanner \
  -Dsonar.host.url=$SONAR_SERVER_URL \
  -Dsonar.projectKey=$PROJECT_KEY \
  -Dsonar.projectName="$PROJECT_NAME" \
  -Dsonar.sources=$PROJECT_SOURCE_DIR
