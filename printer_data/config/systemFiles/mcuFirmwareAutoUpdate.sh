sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=octopus_v1.1_klipper.config
make menuconfig KCONFIG_CONFIG=octopus_v1.1_klipper.config
make -j4 KCONFIG_CONFIG=octopus_v1.1_klipper.config
read -p "Octopus v1.1 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-Klipper_stm32f446xx_2F001C000651343437343531-if00
read -p "Octopus v1.1 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=orbitool_o2s_klipper.config
make menuconfig KCONFIG_CONFIG=orbitool_o2s_klipper.config
make -j4 KCONFIG_CONFIG=orbitool_o2s_klipper.config
read -p "Obitool O2S firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-Klipper_stm32f072xb_Orbitool_O2S-if00
read -p "Obitool O2S firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"


make clean KCONFIG_CONFIG=rpi_klipper.config
make menuconfig KCONFIG_CONFIG=rpi_klipper.config

make -j4 KCONFIG_CONFIG=rpi_klipper.config
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=rpi_klipper.config

sudo service klipper start
