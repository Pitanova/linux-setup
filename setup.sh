#!/bin/bash

declare -A osInfo;
#Of course Pop OS has to be different :P
osInfo[/etc/issue]="apt-get install -y"
osInfo[/etc/debian-version]="apt-get install -y"
osInfo[/etc/fedora-release]="dnf install -y"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
	    package_manager=${osInfo[$f]}
	fi
done

echo "NOTE: Download flatpak and Nerd Fonts before using this script!"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sleep 1

echo "How would you like to set up your system?"
echo "A) Default Apps"
echo "B) Extra Desktop Apps"
echo "C) Exit"
echo -n "[A/B/C]: "
read choice

LIST_OF_DEF_TERMAPPS="btop \
	              neofetch \
		      git \
		      tmux"

LIST_OF_DEF_FLATPAKS="com.bitwarden.desktop \
	              com.usebottles.bottles \
                      com.discordapp.Discord \
		      com.mattjakeman.ExtensionManager \
		      org.flameshot.Flameshot \
		      com.github.tchx84.Flatseal \
		      com.heroicgameslauncher.hgl \
		      org.localsend.localsend_app \
		      com.valvesoftware.Steam \
		      org.telegram.desktop \
		      org.videolan.VLC \
		      com.visualstudio.code"

LIST_OF_EXTRA_TERMAPPS="piper \
			virt-manager"

LIST_OF_EXTRA_FLATPAKS="net.davidotek.pupgui2 \
			com.leinardi.gwe \
			org.openrgb.OpenRGB \
			com.brave.Browser \
			com.dec05eba.gpu_screen_recorder \
			org.kde.kdenlive \
			hu.kramo.Cartridges"

case $choice in
    A|a)
    ${package_manager} $LIST_OF_DEF_TERMAPPS
	flatpak install flathub -y --noninteractive $LIST_OF_DEF_FLATPAKS
    ;;
    B|b)
	${package_manager} $LIST_OF_EXTRA_TERMAPPS
	flatpak install flathub -y --noninteractive $LIST_OF_EXTRA_FLATPAKS
    ;;
    C|c)
    echo "This is still being worked on..."
    exit 1
esac
