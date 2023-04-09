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
echo "C) Gaming Apps"
echo -n "[A/B/C]: "
read choice

LIST_OF_TERMAPPS="btop \
	          	  neofetch \
		  		  git \
		  		  gimp \
		  		  tmux"

LIST_OF_FLATPAKS="com.bitwarden.desktop \
	          	  com.usebottles.bottles \
		  		  com.discordapp.Discord \
		  		  com.mattjakeman.ExtensionManager \
		  		  org.flameshot.Flameshot \
		  		  com.github.tchx84.Flatseal \
		  		  org.localsend.localsend_app \
		  		  org.telegram.desktop \
		    	  org.videolan.VLC \
		  		  com.visualstudio.code"

flatpak_manager=$(flatpak install flathub -y --noninteractive)

case $choice in
    A|a)
    ${package_manager} $LIST_OF_TERMAPPS
    ;;
    B|b)
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    ${flatpak_manager} $LIST_OF_FLATPAKS
    ;;
    C|c)
    echo "This is still being worked on..."
    exit 1
esac
