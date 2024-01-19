#!/bin/bash
#
# Script Name: fork_repo_to_given_ns.sh
# Description: This script fork a Git repo to a given Name Space.
# Author: Samir Ranjan Parhi
# License: Same as Repository Licence
# Usage : Beta-Release
#
set -e
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
BOLD=$(tput bold)


echo -e "\n ${BLUE}Provide the Name of the Source Repository (Something like https://github.com/abc/xyz.git):${RESET}"

read source_repo

echo -e "\n ${BLUE}Provide the Name of the Destination Namespace (Something like samirparhi-dev):${RESET}"

read destination_namespace

# Clone the source repository
git clone $source_repo || { echo "Failed to clone the source repository"; exit 1; }

# Get the repository name from the source repository URL
repo_name=$(basename -s .git $source_repo)

# Create a new repository in the destination namespace
destination_repo="${destination_namespace}/${repo_name}"
git -C $repo_name remote add $destination_namespace "https://github.com/${destination_repo}.git" || { echo "Failed to add remote for the destination repository"; exit 1; }

# Push the code to the destination repository
git -C $repo_name push $destination_namespace master || { echo "Failed to push code to the destination repository"; exit 1; }

echo "Repository forked successfully to ${destination_repo}"
