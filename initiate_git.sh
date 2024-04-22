#!/bin/bash

# Script to manage a local Git repository and sync with GitHub

REPO_NAME="initiate_git"
REPO_PATH="/home/heini/personalScripts/$REPO_NAME"
REPO_URL="git@github.com:epineph/$REPO_NAME.git"  # Replace 'username' with your GitHub username

# Function to initialize a new repository
initialize_repo() {
    mkdir -p "$REPO_PATH"
    cd "$REPO_PATH"
    git init
    gh repo create "$REPO_NAME" --public --source=. --remote=origin
    echo "# $REPO_NAME" > README.md
    git add README.md
    git commit -m "Initial commit"
    git push -u origin main
}

# Function to push changes to GitHub
push_changes() {
    cd "$REPO_PATH"
    git add .
    git commit -m "Update"
    git push
}

# Function to pull latest changes from GitHub
pull_changes() {
    cd "$REPO_PATH"
    git pull origin main
}

# Check command line arguments
if [[ "$1" == "init" ]]; then
    initialize_repo
elif [[ "$1" == "push" ]]; then
    push_changes
elif [[ "$1" == "pull" ]]; then
    pull_changes
else
    echo "Usage: $0 {init|push|pull}"
    exit 1
fi

