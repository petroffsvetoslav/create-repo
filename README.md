## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Prerequisites](#prerequisites)
* [Setup](#setup)
* [Run](#run)


## General info
This script will create a new public Github repo by using a few variables and manual input of your API token for sanity reasons.

## Technologies
Project is created with:
* VSCodium
* Shell

## Prerequisites
* Your .pub ssh key tied to your Githug account.
* Generated Github Personal Access Token.


## Setup
To run this project, Place this script in your user home directory, make sure it's executable and replace these variables in the script:

```
$ cd ~ && chmod+x gitcreate.sh
```

```
VARIABLES
NEW_REPO_NAME="YOUR_NEW_REPO_NAME"
GIT_USER="YOUR_USER"
GIT_EMAIL="YOUR_EMAIL"
```
## Run
Start with:

```
$ cd ~
$ ./gitcreate.sh
```

## TO DO
Make the script read sensitive data from an encrypted file.
