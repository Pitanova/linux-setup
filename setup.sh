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

echo "This is a test print"
