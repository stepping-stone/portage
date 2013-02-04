# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/quimup/quimup-1.3.0.ebuild,v 1.2 2013/01/20 10:23:43 angelos Exp $

EAPI=5
inherit eutils qt4-r2

MY_P=${PN}_${PV}

DESCRIPTION="A Qt4 client for the music player daemon (MPD) written in C++"
HOMEPAGE="http://mpd.wikia.com/wiki/Client:Quimup"
SRC_URI="mirror://sourceforge/musicpd/${MY_P}_src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/qt-gui:4
	>=media-libs/libmpdclient-2.3"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

DOCS=( changelog FAQ.txt README )

src_prepare() {
	sed -i -e "/FLAGS/d" ${PN}.pro || die
	epatch "${FILESDIR}"/${PN}-1.2.0-gcc47.patch
}

src_install() {
	default
	dobin ${PN}

	newicon src/resources/mn_icon.png ${PN}.png
	make_desktop_entry ${PN} Quimup
}