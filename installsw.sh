echo "[1] Updating repository:"
apt update
echo "[2] Unix utils installation:"
apt install -y wget curl g++ gcc cmake make mc dkms python3-pip
echo "[3] Repoistory configuration:"
chown whoami sources.list
cp -f configs/sources.list /etc/apt
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
apt install -y apt-transport-https
echo "[4] Adding wine keys:"
wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
echo "[5] Adding i386 architecture:"
dpkg --add-architecture i386
echo "[6] Updating repository:"
apt update
echo "[7] Fish installation:"
apt install -y fish
chsh -s `which fish`
mkdir -p .config/fish
cp configs/config.fish ~/.config/fish
echo "[8] Kde software installation:"
apt install -y kcolorchooser ktorrent kde-plasma-desktop plasma-widgets-addons ark gwenview kde-runtime-data kde-config-tablet plasma-nm qt5-default okular
echo "[9] Mesa and xorg installation:"
apt install -y mesa-vulkan-drivers:i386 libvulkan1:i386 vulkan-tools vulkan-utils vulkan-validationlayers mesa-vulkan-drivers libvulkan1 xserver-xorg-input-all
echo "[10] Wine installation:"
apt install -y --install-recommends winehq-staging
echo "[11] Font installation:"
wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf"
cp Iosevka\ Nerd\ Font\ Complete.ttf /usr/share/fonts/
echo "[12] Firmware installation:"
apt install -y firmware-linux r8168-dkms
git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
cp -f linux-firmware/amdgpu /lib/firmware
cp -f linux-firmware/amd /lib/firmware
cp -f linux-firmware/amd-ucode /lib/firmware
cp -f linux-firmware/rtl_bt /lib/firmware
cp -f linux-firmware/rtl_nic /lib/firmware
cp -f linux-firmware/rtlwifi /lib/firmware
cp -f linux-firmware/rtw88 /lib/firmware
echo "[13] AMDGPU si/cik support:"
cp -f configs/amdgpu.conf /etc/modprobe.d
cp -f configs/radeon.conf /etc/modprobe.d
echo "[14] Libreoffice installation:"
wget https://download.documentfoundation.org/libreoffice/stable/7.0.4/deb/x86_64/LibreOffice_7.0.4_Linux_x86-64_deb.tar.gz
wget http://download.documentfoundation.org/libreoffice/stable/7.0.4/deb/x86_64/LibreOffice_7.0.4_Linux_x86-64_deb_langpack_ru.tar.gz
tar -zvxf LibreOffice_7.0.4_Linux_x86-64_deb.tar.gz
tar -zvxf LibreOffice_7.0.4_Linux_x86-64_deb_langpack_ru.tar.gz
dpkg -i LibreOffice_7.0.4.2_Linux_x86-64_deb/DEBS/*.deb
dpkg -i LibreOffice_7.0.4.2_Linux_x86-64_deb_langpack_ru/DEBS/*.deb
echo "[15] Optional software:"
apt install steam krita
echo "[16] Optinoal dev software:"
apt install code dotnet-sdk-5.0
echo "Run this command to set fish as default shell: chsh -s \`which fish\`"
