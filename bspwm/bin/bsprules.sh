#!/bin/bash

status=$(xrandr --query | grep 'HDMI1')
connected=' connected'

if grep -q "$connected" <<< "$status"; then
  # 1 > terminal
  bspc rule -a Alacritty follow=on focus=on
  bspc rule -a Xfce4-terminal desktop='^2' follow=on focus=on

  # 2 > web
  bspc rule -a firefox desktop='^3' follow=on focus=on
  bspc rule -a chromium desktop='^3' follow=on focus=on
  bspc rule -a Brave-browser desktop='^3' follow=on focus=on

  # 3 > files
  declare -a files=(Pcmanfm Thunar qBittorrent)
  for i in ${files[@]}; do
     bspc rule -a $i desktop='^4' follow=on focus=on; done

  # 4 > code
  declare -a code=(Geany code-oss Code)
  for i in ${code[@]}; do
     bspc rule -a $i desktop='^5' follow=on focus=on; done

  # 5 > office and docs
  declare -a office=(Gucharmap Atril Evince \
  libreoffice-writer libreoffice-calc libreoffice-impress \
  libreoffice-startcenter libreoffice Soffice *:libreofficedev *:soffice)
  for i in ${office[@]}; do
     bspc rule -a $i desktop='^6' follow=on focus=on; done

  # 6 > Communication
  declare -a comm=(Thunderbird TelegramDesktop Hexchat discord)
  for i in ${comm[@]}; do
     bspc rule -a $i desktop='^7' follow=on focus=on; done

  # 7 > media
  declare -a media=(Audacity Music MPlayer Lxmusic Inkscape Gimp-2.10 obs)
  for i in ${media[@]}; do
     bspc rule -a $i desktop='^8' state=floating follow=on focus=on; done

  # 8 > settings
  bspc rule -a 'VirtualBox Manager' desktop='^9' follow=on focus=on
  bspc rule -a GParted desktop='^9' follow=on focus=on
  declare -a settings=(Lxappearance Lxtask Lxrandr Arandr \
  System-config-printer.py Pavucontrol Exo-helper-1 \
  Xfce4-power-manager-settings)
  for i in ${settings[@]}; do
     bspc rule -a $i desktop='^9' state=floating follow=on focus=on; done

  # special rules
  declare -a floating=(alacritty-float Pcmanfm Onboard Yad \
  Viewnior feh Nm-connection-editor)
  for i in ${floating[@]}; do
     bspc rule -a $i state=floating follow=on focus=on; done

  bspc rule -a Conky state=floating manage=off
  bspc rule -a stalonetray state=floating manage=off

else
  # 1 > terminal
  bspc rule -a Alacritty follow=on focus=on
  bspc rule -a Xfce4-terminal desktop='^1' follow=on focus=on

  # 2 > web
  bspc rule -a firefox desktop='^2' follow=on focus=on
  bspc rule -a chromium desktop='^2' follow=on focus=on
  bspc rule -a Brave-browser desktop='^2' follow=on focus=on

  # 3 > files
  declare -a files=(Pcmanfm Thunar qBittorrent)
  for i in ${files[@]}; do
     bspc rule -a $i desktop='^3' follow=on focus=on; done

  # 4 > code
  declare -a code=(Geany code-oss Code)
  for i in ${code[@]}; do
     bspc rule -a $i desktop='^4' follow=on focus=on; done

  # 5 > office and docs
  declare -a office=(Gucharmap Atril Evince \
  libreoffice-writer libreoffice-calc libreoffice-impress \
  libreoffice-startcenter libreoffice Soffice *:libreofficedev *:soffice)
  for i in ${office[@]}; do
     bspc rule -a $i desktop='^5' follow=on focus=on; done

  # 6 > Communication
  declare -a comm=(Thunderbird TelegramDesktop Hexchat discord)
  for i in ${comm[@]}; do
     bspc rule -a $i desktop='^6' follow=on focus=on; done

  # 7 > media
  declare -a media=(Audacity Music MPlayer Lxmusic Inkscape Gimp-2.10 obs Spotify)
  for i in ${media[@]}; do
     bspc rule -a $i desktop='^7' state=floating follow=on focus=on; done

  # 8 > settings
  bspc rule -a 'VirtualBox Manager' desktop='^8' follow=on focus=on
  bspc rule -a GParted desktop='^8' follow=on focus=on
  declare -a settings=(Lxappearance Lxtask Lxrandr Arandr \
  System-config-printer.py Pavucontrol Exo-helper-1 \
  Xfce4-power-manager-settings)
  for i in ${settings[@]}; do
     bspc rule -a $i desktop='^8' state=floating follow=on focus=on; done

  # special rules
  declare -a floating=(alacritty-float Pcmanfm Onboard Yad \
  Viewnior feh Nm-connection-editor)
  for i in ${floating[@]}; do
     bspc rule -a $i state=floating follow=on focus=on; done

  bspc rule -a Conky state=floating manage=off
  bspc rule -a stalonetray state=floating manage=off
fi
