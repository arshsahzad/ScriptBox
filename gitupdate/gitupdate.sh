#!/bin/bash

# Enter Commitor/Author Email Address
git filter-branch --env-filter '
OLD_EMAIL="admin@arshsahzad.com"
CORRECT_NAME="Arsh Sahzad"
CORRECT_EMAIL="admin@arsh.dev"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
export GIT_COMMITTER_NAME="$CORRECT_NAME"
export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
export GIT_AUTHOR_NAME="$CORRECT_NAME"
export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

# Command for Force Push Commit
git push --force --tags origin 'refs/heads/*'
