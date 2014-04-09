# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnustep-apps/fisicalab/fisicalab-0.3.4.ebuild,v 1.1 2014/03/24 20:52:17 voyageur Exp $

EAPI=5
inherit gnustep-2

DESCRIPTION="educational application to solve physics problems"
HOMEPAGE="www.gnu.org/software/fisicalab"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sci-libs/gsl-1.10
	>=virtual/gnustep-back-0.16.0"
RDEPEND="${DEPEND}"