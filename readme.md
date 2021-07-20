# Symbiflow examples

## new example for Zync 7010 EBAZ 4205

Uses Arch  Linux as tool to exercise GPIO

self built version of u-boot and kernel from Petalinux used to boot Arch

Arch downloaded from: 

```
 1074  pushd uboot-linux-images
 1075  wget -qO- https://github.com/SymbiFlow/symbiflow-xc7z-automatic-tester/releases/download/v1.0.0/uboot-linux-images.zip | bsdtar -xf-
 1076  popd
 1077  mc
 1078  cp uboot-linux-images/boot/* /media/david/BOOT/
 1079  sync
 1080  wget -qO- http://de5.mirror.archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz | sudo tar -xvzC /media/david/Root
 1081  sync
 1082  sudo cp -a uboot-linux-images/root/* /media/david/Root/
 1083  sync
 1084  sudo cp -a uboot-linux-images/root/* /media/david/Root/root
 1085  sync
```

export INSTALL_DIR=/opt/symbiflow
FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
cd ~/symbiflow-examples/xc7/counter_test
TARGET="ebaz4205" make -C counter_test


```
# u-boot command to load bitstream using tftp
set loadbit_addr 1000000
set ipaddr 192.168.178.121
set serverip 192.168.178.24
tftpboot ${loadbit_addr} ${serverip}:top.bit
fpga loadb 0 ${loadbit_addr} ${filesize}boot

# Arch Linux commands to configure EMIO 0 gpio
# base is 906, first emio is base +54
echo "960" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio960/direction
# start counting
echo "0" > /sys/class/gpio/gpio960/value
# stop counting
echo "1" > /sys/class/gpio/gpio960/value

# Arch Linux command to configure MIO 1 gpio
echo "961" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio961/direction

# forward counting
echo "0" > /sys/class/gpio/gpio961/value
# reverse counting
echo "1" > /sys/class/gpio/gpio961/value
```


