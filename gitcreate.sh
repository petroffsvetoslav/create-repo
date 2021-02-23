#!/bin/bash

#Variables
NEW_REPO_NAME="zzz"
GIT_USER="Svetoslav Petrov"
GIT_EMAIL="petroffsvetoslav@gmail.com"

#File name that will contain sensitive data
FILENAME=token.conf

#Create local project directory
mkdir -p ~/Desktop/"$NEW_REPO_NAME"

#Configure your API tocken on this step
echo -n "Paste API tocken here: "
read -r GH_API_TOKEN
echo "$GH_API_TOKEN" > "$FILENAME"

#Encryptin the sensitive data file
echo "Configure password for the sensitive data file"
openssl enc -aes-256-cbc -pbkdf2 -iter 20000 -in "$FILENAME" -out "$FILENAME".enc

#Decrypt the sensitive data file
echo "Decrypt the sensitive data file"
xargs -a "$FILENAME" openssl enc -d -aes-256-cbc -pbkdf2 -iter 20000 -in "$FILENAME".enc -out "$FILENAME" > /dev/null 2>&1

#Make API call
LINES=$(cat $FILENAME)

for LINE in $LINES
do
    curl -H "Authorization: token $LINE" https://api.github.com/user/repos -d '{"name": "'"${NEW_REPO_NAME}"'"}'
done

#Remove the sensitive data file after call
rm "$FILENAME"

#Change to new project directory
cd ~/Desktop/"$NEW_REPO_NAME"

#Config remote git repository
echo "$NEW_REPO_NAME" >> README.md
git init
git config user.name "$GIT_USER"
git config user.email "$GIT_EMAIL"
git add README.md
git commit -m "adding README file and .gitignore"
git branch -M master
git remote add origin git@github.com:petroffsvetoslav/"$NEW_REPO_NAME".git
git push -u origin master