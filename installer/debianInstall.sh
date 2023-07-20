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
cd ../$builddir
mkdir -p /home/$username/Pictures
mkdir -p /home/$username/.config
ln -s .config/* /home/$username/.config/
ln -s wallpapers/ /home/$username/Pictures/
find . -mindepth 1 -maxdepth 1 ! -name '.config' ! -name 'wallpapers' ! -name '.git' ! -name 'usr' ! -name 'etc' ! -name 'README.md' ! -name 'installer' ! -name '70-synaptics.conf' -exec ln -s "$(pwd)/{}" /home/$username/ \;
chown -R $username:$username /home/$username

# Installing Essential Programs 
nala install --no-install-recommends sddm -y
sddm --example-config > sddm.conf
mv sddm.conf /etc/
systemctl enable sddm
systemctl set-default graphical.target
nala install feh kitty rofi thunar python3-pip python3-full python3-yaml pipx lxpolkit x11-xserver-utils unzip wget pipewire-audio qpwgraph pavucontrol build-essential libx11-dev bspwm polybar ranger neovim curl ninja-build meson arandr autorandr libssl-dev -y
arandr
autorandr --save undock --default
curl -fsSL https://fnm.vercel.app/install | bash
source /home/$username/.bashrc
fnm install --lts
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source /home/$username/.cargo/env
cargo add openssl
curl -LO https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Debian12.deb
nala install -y ./wezterm-nightly.Debian12.deb
nala install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev libpcre3-dev cmake -y
git clone https://github.com/jonaburg/picom
cd picom
meson --buildtype=release . build
ninja -C build
# To install the binaries in /usr/local/bin (optional)
sudo ninja -C build install
cd ../$builddir

# Installing Other less important Programs
nala install neofetch firefox-esr btop cmatrix nsnake -y
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | tee /etc/apt/sources.list.d/notion-repackaged.list
nala update
nala install notion-app-enhanced -y
cd /usr/local/bin
git clone https://github.com/seamus-45/roficlip.git
cd roficlip
pip install docopt pyxdg pygobject pyyaml notify2 --break-system-packages
# SDDM theme

cd ../$builddir 
nala install fonts-font-awesome fonts-roboto -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip
unzip CascadiaCode.zip -d /home/$username/.fonts

exit
systemctl --user --now enable wireplumber.service
fc-cache -fv
