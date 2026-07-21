#!/bin/bash

curl -s --compressed "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ctu-mrs.gpg >/dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/ctu-mrs-unstable.list "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs-apt.list"
sudo curl -s --compressed -o /etc/apt/preferences.d/ctu-mrs-unstable-preferences "https://ctu-mrs.github.io/ppa-unstable/ctu-mrs-ppa-preferences.txt"

sudo apt-get -y update
