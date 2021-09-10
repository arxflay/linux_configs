git clone --depth=1 https://github.com/neovim/neovim.git
pip3 install meson ninja
apt install -y clangd pkgconf gettext libtool libtool-bin gperf luajit luarocks libuv1-dev libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev libvterm-dev libutf8proc-dev
luarocks build mpack
luarocks build lpeg
luarocks build inspect
make -C neovim/ deps  CMAKE_BUILD_TYPE=RelWithDebInfo
make -C neovim/ install CMAKE_BUILD_TYPE=RelWithDebInfo
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp configs/.selected_editor ~/
mkdir -p ~/.config/nvim
cp configs/init.vim ~/.config/nvim
rm -r neovim
