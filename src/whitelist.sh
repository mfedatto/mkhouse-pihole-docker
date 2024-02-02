#!/bin/bash

apt update
apt install python3 -y
cd

# The name of the directory to check/create
dir_name="whitelist"

# The Git repository URL to clone/pull from
repo_url="https://github.com/anudeepND/whitelist.git"

# Check if the directory already exists
if [ -d "$dir_name" ]; then
  echo "Directory '$dir_name' already exists. Doing a 'git pull'..."
  cd "$dir_name"
  git pull
else
  echo "Directory '$dir_name' does not exist. Doing a 'git clone'..."
  git clone "$repo_url" "$dir_name"
fi

python3 whitelist/scripts/whitelist.py

cat /etc/crontab >> crontab.tmp
echo "0 1 * * */7     root    /root/whitelist/scripts/whitelist.py" >> crontab.tmp

cp crontab.tmp /etc/crontab
rm crontab.tmp
