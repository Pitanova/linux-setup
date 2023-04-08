#!/bin/bash

declare -A osInfo;
osInfo[/etc/debian-version]="apt-get install -y"
osInfo[/etc/fedora-release]="dnf install -y"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
	package_manager=${osInfo[$f]}
    fi
done

echo "NOTE: Download flatpak and Nerd Fonts before using this script!"
sleep 1

echo "What are you downloading?"
echo "A) Terminal Apps"
echo "B) Flatpak Apps"
echo "Gaming Apps"
