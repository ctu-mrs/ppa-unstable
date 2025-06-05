#!/bin/bash

echo "$0: Removing MRS Unstable PPA repository"

sudo rm /etc/apt/sources.list.d/ctu-mrs-unstable.list
sudo rm /etc/apt/preferences.d/ctu-mrs-unstable-preferences
sudo rm /etc/ros/rosdep/sources.list.d/ctu-mrs-unstable.list

sudo apt-get -y update
rosdep update --include-eol-distros

echo "$0: Finished removing MRS Unstable PPA repository"
