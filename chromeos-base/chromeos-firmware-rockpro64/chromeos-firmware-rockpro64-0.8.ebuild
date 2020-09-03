# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

CROS_WORKON_REPO="https://github.com/ayufan-rock64"
CROS_WORKON_COMMIT="b792eed5bee7e0e492d8e03324938537c9bb749e"
CROS_WORKON_BLACKLIST="1"
CROS_WORKON_PROJECT="linux-package"

DEPEND=""
RDEPEND="${DEPEND}"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"

DEPEND=""
RDEPEND=""

EGIT_BOOTSTRAP='git clean -dfx; git reset --hard; git checkout -f;'

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit git-2 cros-workon

src_configure() {
  echo "Hello World"
}

src_compile() {
  echo "Hello World"
}

src_install() {
  insinto "/etc/"
  doins -r "${S}/root/etc/firmware/"

  insinto "/lib/firmware/"
  doins -r "${S}/root/lib/firmware/rtlbt/"
}
