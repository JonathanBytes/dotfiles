#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./debianInstall.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Making .config and Moving config files and wallpapers to Pictures
cd $builddir
mkdir -p /home/$username/Pictures
mkdir -p /home/$username/.config
ln -s $builddir/.config/* /home/$username/.config
ln -s $builddir/wallpapers/ /home/$username/Pictures/
chown -R $username:$username /home/$username

# Installing Essential Programs 
nala install --no-install-recommends sddm -y
sddm --example-config > sddm.conf
mv sddm.conf /etc/
systemctl enable sddm
systemctl set-default graphical.target
nala install acpi bat feh kitty rofi thunar xutils xinput python3-pip python3-full python3-yaml pipx lxpolkit x11-xserver-utils unzip wget pipewire-audio qpwgraph pavucontrol build-essential libx11-dev bspwm polybar ranger curl ninja-build meson arandr autorandr libssl-dev -y
curl -LO https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Debian12.deb
nala install -y ./wezterm-nightly.Debian12.deb
rm wezterm-nightly.Debian12.deb
nala install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev libpcre3-dev cmake -y
git clone https://github.com/jonaburg/picom
cd picom
meson --buildtype=release . build
ninja -C build
# To install the binaries in /usr/local/bin (optional)
ninja -C build install

cd $builddir
# Installing Other less important Programs
 
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh && sh setup.sh
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh

cd $builddir

nala install exa trash-cli tree zsh neofetch firefox-esr btop cmatrix nsnake oneko zsh-autosuggestions zsh-syntax-highlighting -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | tee /etc/apt/sources.list.d/notion-repackaged.list
nala update
nala install notion-app-enhanced -y
# SDDM theme

reboot
