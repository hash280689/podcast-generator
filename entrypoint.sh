#!/bin/bash

echo "=================="

#Use GITHUB_ACTOR to get name of user running the action
git config --global user.name "${GITHUB_ACTOR}"

#Use INPUT_EMAIL to get email of user running the action
git config --global user.email "${INPUT_EMAIL}"

#Add the line below to enable access to workspaces and run git operations
git config --global --add safe.directory /github/workspace

#Docker file should copy these files into this dir
python3 /usrs/bin/feed.py

git add -A && git commit -m "Update Feed"

#ensure the correct branch is being pushed to especially if this is a brand new setup
#This will push things back to the server
git push --set-upstream origin main

echo "=================="