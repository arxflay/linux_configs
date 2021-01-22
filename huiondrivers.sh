#[1] Installing dependency
apt install -y "linux-headers-"(uname -r) 
#[2] Installation
git clone --depth=1 https://github.com/Huion-Linux/DIGImend-kernel-drivers-for-Huion.git
cd DIGImend-kernel-drivers-for-Huion
make dkms_install
