#! /usr/bin/bash


sudo apt update
sudo apt upgrade -y
while read line; do
# Reading each line
  sudo apt install -y $line
done < ./list_programs

# cat list_programs | xargs sudo apt install -y
pip3 install autotiling
