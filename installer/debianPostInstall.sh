#!/bin/bash

builddir=$(pwd)
find . -mindepth 1 -maxdepth 1 ! -name '.config' ! -name 'wallpapers' ! -name '.git' ! -name 'usr' ! -name 'etc' ! -name 'README.md' ! -name 'installer' ! -name 'picom' ! -name '70-synaptics.conf' -execdir sh -c 'username=$(id -u -n 1000) && ln -s "$(realpath "$0")" "/home/$username/$0"' {} \;
arandr
autorandr --save undock 
autorandr --default undock
curl -fsSL https://fnm.vercel.app/install | bash
source /home/$USER/.bashrc
$HOME/.local/share/fnm/fnm install --lts
curl -fsSL https://get.pnpm.io/install.sh | sh -
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source /home/$USER/.cargo/env
$HOME/.cargo/bin/cargo add openssl
$HOME/.cargo/bin/cargo install --git https://github.com/MordechaiHadad/bob.git
bob install stable
bob use stable
sudo nala install python3-neovim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

cd /usr/local/bin
sudo git clone https://github.com/seamus-45/roficlip.git
cd roficlip
pip install docopt pyxdg pygobject pyyaml notify2 --break-system-packages

systemctl --user --now enable wireplumber.service

cd $builddir 
sudo nala install fonts-font-awesome fonts-roboto -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
unzip FiraCode.zip -d /home/$USER/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip
unzip CascadiaCode.zip -d /home/$USER/.fonts
fc-cache -fv
