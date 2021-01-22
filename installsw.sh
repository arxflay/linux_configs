echo "[1] Updating repository:"
apt update
echo "[2] Unix utils instalation:"
apt install -y wget curl g++ gcc cmake make git
echo "[3] Adding i386 architecture:"
dpkg --add-architecture i386
echo "[4] Repoistory configuration:"
wget https://download1478.mediafire.com/9tp2ph0pfyzg/8vvhun878uhxak5/sources.list
chown whoami sources.list
cp -f sources.list /etc/apt/
echo "[5] Adding wine keys:"
wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
echo "[6] Updating repository:"
apt update
echo "[7] Fish installation:"
apt install -y fish
chsh -s `which fish`
echo "[8] Kde software installation:"
apt install -y kcolorchooser ktorrent kde-plasma-desktop plasma-widgets-addons ark gwenview
echo "[9] Mesa installation:"
apt install -y mesa-vulkan-drivers:i386 libvulkan1:i386 vulkan-tools vulkan-utils vulkan-validationlayers mesa-vulkan-drivers libvulkan1
echo "[10] Wine installation:"
apt install -y --install-recommends winehq-staging
