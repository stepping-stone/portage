# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-equake-plugin/xfce4-equake-plugin-1.3.0.ebuild,v 1.1 2013/06/27 12:33:55 ssuominen Exp $

EAPI=5
inherit xfconf

DESCRIPTION="Panel plug-in that displays information about earthquakes at regular intervals"
HOMEPAGE="http://www.e-quake.org/"
SRC_URI="http://www.e-quake.org/wp-uploads/2013/06/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2
	x11-libs/gtk+:2
	x11-libs/libX11
	>=xfce-base/libxfce4util-4.10
	>=xfce-base/libxfcegui4-4.10
	>=xfce-base/xfce4-panel-4.10"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog NEWS README )
}