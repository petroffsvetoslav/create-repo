#!/bin/bash

#VARIABLES

#Configure your API tocken here
echo -n "Paste API tocken here: "
read -r -s GH_API_TOKEN

#Set name for the new repository
NEW_REPO_NAME="zazz"

#Configure your Github username and email address
GIT_USER="Svetoslav Petrov"
GIT_EMAIL="petroffsvetoslav@gmail.com"

#Create git project dir
mkdir -p ~/Desktop/"$NEW_REPO_NAME" && cd ~/Desktop/"$NEW_REPO_NAME"

#Create the repo by making an API call
curl -H "Authorization: token $GH_API_TOKEN" https://api.github.com/user/repos -d '{"name": "'"${NEW_REPO_NAME}"'"}'

#Config git repository
echo "$NEW_REPO_NAME" >> README.md
git init
git config user.name "$GIT_USER"
git config user.email "$GIT_EMAIL"
git add README.md
git commit -m "adding README file"
git branch -M master
git remote add origin git@github.com:petroffsvetoslav/"$NEW_REPO_NAME".git
git push -u origin master