EAPI=5

VARIANT="pinebookpro"
DESCRIPTION="Rockchip U-boot"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_compile() {
	mkimage -O linux -T script -C none -a 0 -e 0 \
		-n "boot" -d "${FILESDIR}/boot.cmd" "boot.scr" || die
	mkdir rockchip-u-boot
	cd rockchip-u-boot
	cp ${FILESDIR}/idbloader.img .
	cp ${FILESDIR}/uboot_pinebookpro.itb .
}

src_install() {
	insinto /boot
	doins boot.scr
	doins rockchip-u-boot/idbloader.img
	doins rockchip-u-boot/uboot_pinebookpro.itb
}

