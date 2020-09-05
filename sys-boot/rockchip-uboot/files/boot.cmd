setenv fdtfile rk3399-pinebook-pro.dtb
setenv bootdevice mmcblk0 # SD

echo "FDT: ${fdtfile}"
echo "Bootdevice: ${bootdevice}"

setenv bootargs init=/sbin/init rw console=tty0 console=ttyS0,115200 no_console_suspend earlycon=uart,mmio32,0x01c28000 panic=10 consoleblank=0 loglevel=1 cma=256M root=/dev/mmcblk0p1

printenv

echo Loading DTB
load mmc ${mmc_bootdev}:1 ${fdt_addr_r} ${fdtfile}

echo Loading Initramfs
load mmc ${mmc_bootdev}:1 ${ramdisk_addr_r} uInitrd.img

echo Loading Kernel
load mmc ${mmc_bootdev}:1 ${kernel_addr_r} Image

echo Resizing FDT
fdt addr ${fdt_addr_r}
fdt resize

echo Booting kernel
booti ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}
