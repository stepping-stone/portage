# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/voro++/voro++-0.4.6-r1.ebuild,v 1.2 2014/03/31 14:22:36 nimiux Exp $

EAPI=5

inherit cmake-utils multilib

DESCRIPTION="A 3D Voronoi cell software library"
HOMEPAGE="http://math.lbl.gov/voro++/"
SRC_URI="${HOMEPAGE}/download/dir/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-cmake.patch" )

src_configure() {
	mycmakeargs=( -DLIB=$(get_libdir) )
	cmake-utils_src_configure
}