find . -mindepth 1 -maxdepth 1 ! -name '.config' ! -name 'wallpapers' ! -name '.git' ! -name 'usr' ! -name 'etc' ! -name 'README.md' ! -name 'installer' ! -name '70-synaptics.conf' -execdir sh -c 'ln -s "$(realpath "$0")" "/home/$USER/$0"' {} \;
arandr
autorandr --save undock --default
curl -fsSL https://fnm.vercel.app/install | bash
source /home/$USER/.bashrc
fnm install --lts
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source /home/$USER/.cargo/env
cargo add openssl
cd /usr/local/bin
git clone https://github.com/seamus-45/roficlip.git
cd roficlip
pip install docopt pyxdg pygobject pyyaml notify2 --break-system-packages
systemctl --user --now enable wireplumber.service
fc-cache -fv
