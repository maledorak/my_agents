#! /bin/bash

echo "Validating..."

# Check if the repo is a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: The provided path is not a git repository."
    exit 1
fi

if [ -n "$GIT_AUTHOR_EMAIL" ]; then
    git config --global user.email "$GIT_AUTHOR_EMAIL"
elif ! git config user.email > /dev/null 2>&1; then
    echo "Error: The git user email is not set."
    echo "Please do the following and try again:"
    echo "  git config user.email \"your_email@example.com\""
    echo "Or set the GIT_AUTHOR_EMAIL environment variable."
    exit 1
fi

if [ -n "$GIT_AUTHOR_NAME" ]; then
    git config --global user.name "$GIT_AUTHOR_NAME"
elif ! git config user.name > /dev/null 2>&1; then
    echo "Error: The git user name is not set."
    echo "Please do the following and try again:"
    echo "  git config user.name \"Your Name\""
    echo "Or set the GIT_AUTHOR_NAME environment variable."
    exit 1
fi

echo "Starting aider..."
exec aider "$@"
