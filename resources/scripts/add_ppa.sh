#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: Adding MRS Unstable PPA repository"

sudo apt-get -y install curl gpg dpkg-dev

ARCH=$(dpkg-architecture -qDEB_HOST_ARCH)

curl -s --compressed "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ctu-mrs.gpg >/dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/ctu-mrs-unstable.list "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs-apt.list"
sudo curl -s --compressed -o /etc/apt/preferences.d/ctu-mrs-unstable-preferences "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs-ppa-preferences.txt"
sudo curl -s --compressed -o /etc/ros/rosdep/sources.list.d/ctu-mrs-unstable.list "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs-$ARCH.list"
sudo apt-get -y update

rosdep update --include-eol-distros

echo "$0: Finished adding MRS Unstable PPA repository"
