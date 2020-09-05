EAPI=5

VARIANT="pinebookpro"
DESCRIPTION="linux"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"

DEPEND="!sys-kernel/chromeos-kernel-4_4"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_compile() {
	cp ${FILESDIR}/linux-5.8.6-1-aarch64/boot/Image .
	cp ${FILESDIR}/linux-5.8.6-1-aarch64/boot/Image.gz .
	cp ${FILESDIR}/linux-5.8.6-1-aarch64/boot/dtbs/rockchip/rk3399-pinebook-pro.dtb .
	mkdir modules
	cp -rvf ${FILESDIR}/linux-5.8.6-1-aarch64/usr/lib/modules modules

}

src_install() {
	insinto /boot
	doins Image
	doins Image.gz
	doins rk3399-pinebook-pro.dtb
	insinto /lib
	doins modules
}
