LIBREOFFICE_VER=7.2.0
LIBREOFFICE_PATH=LibreOffice_$(LIBREOFFICE_VER)_Linux_x86-64_deb
LIBREOFFICE_RULANG_PATH=LibreOffice_$(LIBREOFFICE_VER)_Linux_x86-64_deb_langpack_ru
DWM_CONFIGS_PATH=dwm_configs

echo "[1] Updating repository:"
apt update

echo "[2] Unix utils installation:"
apt install -y wget curl g++ gcc cmake make mc dkms python3-pip clang

echo "[3] Reposistory configuration:"
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

echo "[7] zsh installation:"
apt install -y zsh
chsh -s `/usr/bin/zsh`

echo "[8] Kde software installation:"
apt install -y kcolorchooser ktorrent kde-plasma-desktop plasma-widgets-addons ark gwenview kde-runtime-data kde-config-tablet plasma-nm plasma-discover-backend-flatpak qt5-default okular

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
cp -rf linux-firmware/amdgpu /lib/firmware
cp -rf linux-firmware/amd /lib/firmware
cp -rf linux-firmware/amd-ucode /lib/firmware
cp -rf linux-firmware/rtl_bt /lib/firmware
cp -rf linux-firmware/rtl_nic /lib/firmware
cp -rf linux-firmware/rtlwifi /lib/firmware
cp -rf linux-firmware/rtw88 /lib/firmware

echo "[13] AMDGPU si/cik support:"
cp -f configs/amdgpu.conf /etc/modprobe.d
cp -f configs/radeon.conf /etc/modprobe.d

echo "[14] Libreoffice installation:"
wget https://download.documentfoundation.org/libreoffice/stable/$(LIBREOFFICE_VER)/deb/x86_64/$(LIBREOFFICE_PATH).tar.gz
wget https://download.documentfoundation.org/libreoffice/stable/$(LIBREOFFICE_VER)/deb/x86_64/$(LIBREOFFICE_RULANG_PATH_PATH).tar.gz
tar -zvxf $(LIBREOFFICE_PATH).tar.gz
tar -zvxf $(LIBREOFFICE_RULANG_PATH_PATH).tar.gz
dpkg -i $(LIBREOFFICE_PATH)/DEBS/*.deb
dpkg -i $(LIBREOFFICE_RULANG_PATH_PATH)/DEBS/*.deb

echo "[15] Optional software:"
apt install steam krita firefox-esr doublecmd-gtk gnome-keyring

echo "[16] Optional dev software:"
apt install code dotnet-sdk-5.0

echo "[17] Dwm"
echo "Installing dependencies..."
apt install -y mate-utils pavucontrol fonts-noto-color-emoji ttf-ancient-fonts compton compton-conf libxinerama-dev
apt build-dep -y dwm
git clone https://github.com/arxflay/dwm.git
git clone https://github.com/arxflay/dmenu
echo "Building and installing dwm and dmenu"
make -C dwm install
make -C dmenu install
mkdir /usr/share/dwm_modules
mkdir $HOME/.dwm
echo "Copying configuration"
cp $(DWM_CONFIGS_PATH)/dwm.desktop /usr/share/xsessions
cp $(DWM_CONFIGS_PATH)/dwm-bar /usr/share/dwm_modules
cp $(DWM_CONFIGS_PATH)/bg.jpg $HOME
cp $(DWM_CONFIGS_PATH)/switch_klayout.sh $HOME
cp $(DWM_CONFIGS_PATH)/autostart.sh $HOME/.dwm

echo "[18] Final steps"
apt install -y ttf-ancient-fonts connman alsa-utils
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
cp -f configs/NetworkManager.conf /etc/NetworkManager

echo "[19] Cleanup"
rm -rf $(LIBREOFFICE_PATH) $(LIBREOFFICE_RULANG_PATH_PATH) linux-firmware
rm -f *.tar.gz packages.microsoft.gpg winehq.key Iosevka\ Nerd\ Font\ Complete.ttf

echo "Run this command to set fish as default shell: chsh -s \'/usr/bin/zsh\'"
