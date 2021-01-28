#[1] Installation
git clone --depth=1 https://github.com/Huion-Linux/DIGImend-kernel-drivers-for-Huion.git
make -C DIGImend-kernel-drivers-for-Huion dkms_install
rm -rf DIGImend-kernel-drivers-for-Huion
