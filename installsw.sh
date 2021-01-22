echo "[1] Updating repository:"
apt update
echo "[2] Unix utils instalation:"
apt install -y wget curl g++ gcc cmake make git mc dkms
echo "[3] Repoistory configuration:"
chown whoami sources.list
cp -f sources.list /etc/apt
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
cp config.fish ~/.config/fish
echo "[8] Network-manager installation:"
apt install -y network-manager
echo "[9] Kde software installation:"
apt install -y kcolorchooser ktorrent kde-plasma-desktop plasma-widgets-addons ark gwenview kde-runtime-data kde-config-tablet
echo "[10] Mesa installation:"
apt install -y mesa-vulkan-drivers:i386 libvulkan1:i386 vulkan-tools vulkan-utils vulkan-validationlayers mesa-vulkan-drivers libvulkan1
echo "[11] Wine installation:"
apt install -y --install-recommends winehq-staging
echo "[12] Optional software:"
apt install steam krita
