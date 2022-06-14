#! /usr/bin/env bash

COMMIT_NAME=$1
skip=$2

git add .

if [ -n "$COMMIT_NAME" ]
then
	if [[ $skip = "-s" ]]
	then
		git commit -am "${COMMIT_NAME} [skip ci]"
	else
		git commit -m $COMMIT_NAME
	fi
else
	echo "Передайте имя коммита первым параметром"
fi

git push
