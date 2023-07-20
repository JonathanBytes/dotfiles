arandr
autorandr --save undock --default
curl -fsSL https://fnm.vercel.app/install | bash
source /home/$username/.bashrc
fnm install --lts
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source /home/$username/.cargo/env
cargo add openssl
cd /usr/local/bin
git clone https://github.com/seamus-45/roficlip.git
cd roficlip
pip install docopt pyxdg pygobject pyyaml notify2 --break-system-packages
systemctl --user --now enable wireplumber.service
fc-cache -fv
