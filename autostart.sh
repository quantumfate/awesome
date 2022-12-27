#!/bin/bash
function run() {
  # check if the program is installed and executable
  if which "$1" > /dev/null; then
    # check if the program is already running
    if ! pgrep -f "$1" > /dev/null; then
      # execute the program if it is not running
      eval "$@" &
    fi
  else
    # output an error message if the program is not installed or executable
    echo "Error: program $1 is not installed or executable."
    echo $1 >> notinstalled
  fi
}
run nm-applet
run redshift -l ${LAT}:${LON}
run xfce4-clipman
run caffeine
run pamac-tray
run xfce4-power-manager
run blueberry-tray
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on
run volumeicon
#run nitrogen --restore
run conky -c $HOME/.config/awesome/system-overview
#you can set wallpapers in themes as well
run feh --bg-fill /home/leonch/.config/awesome/wallpaper/arcolinux-wallpapers.jpg &
run udiskie -a -s --terminal=Alacrity
run pdfwatcher
#run applications from startup
#run firefox
#run atom
run dropbox
#run insync start
run spotify
#run ckb-next -b
run discord
#run telegram-desktop
