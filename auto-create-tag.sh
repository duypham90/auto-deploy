#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
PREFIX_TAG='v-banana-'

function status() {
  echo -e "${GREEN}$1${NC}"
}

function print_something () {
    echo Hello $1
}

function banana() {
    status "git checkout TEST-1"

    git checkout TEST-1 & git pull -r  > /dev/null 2>&1

    #status "Fetch new tags"
    git fetch --all --tags

    #status "create new tag ..."
    now="$(date +'%m%d%H%M')"
    TAG=$PREFIX_TAG$now

    status "Create tag..."
    git tag ${TAG}

    status "New tag: ${TAG}"
}

if [ $1 = banana ]
then
banana
fi
