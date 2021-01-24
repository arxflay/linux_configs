echo "[1] Updating repository:"
apt update
echo "[2] Unix utils installation:"
apt install -y wget curl g++ gcc cmake make git mc dkms python3-pip
echo "[3] Repoistory configuration:"
chown whoami sources.list
cp -f configs/sources.list /etc/apt
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
apt install -y kcolorchooser ktorrent kde-plasma-desktop plasma-widgets-addons ark gwenview kde-runtime-data kde-config-tablet plasma-nm
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
echo "[13]AMDGPU si/cik support:"
cp -f configs/amdgpu.conf /etc/modprobe.d
cp -f configs/radeon.conf /etc/modprobe.d
echo "[14] Optional software:"
apt install steam krita
echo "Run this command to set fish as default shell: chsh -s \`which fish\`"
