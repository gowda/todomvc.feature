#!/usr/bin/env bash

function __chrome_stable_version {
  google-chrome-stable --version | \
    cut -d' ' -f3 | \
    sed -n 's/^\([0-9]*\(\.[0-9]*\)\{2\}\).*/\1/p';
}

function __chromedriver_version {
  curl --stderr /dev/null \
       "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$1";
}

function __init {
  set -x
  VERSION=$(__chromedriver_version $(__chrome_stable_version))
  CHROMEDRIVER_URL="https://chromedriver.storage.googleapis.com/$VERSION/chromedriver_linux64.zip";
}

function main {
  wget $CHROMEDRIVER_URL;
  sudo unzip chromedriver_linux64.zip -d /usr/local/bin;
  sudo chmod og+rx /usr/local/bin/chromedriver;
}

__init && main
