#! /bin/bash

COMMIT_NAME=$1

git add .

git commit -m $COMMIT_NAME

git push