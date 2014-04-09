# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/perl-Dumpvalue/perl-Dumpvalue-1.170.0-r1.ebuild,v 1.3 2014/04/02 18:55:17 maekke Exp $

DESCRIPTION="Virtual for perl-core/Dumpvalue"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~x86"
IUSE=""

DEPEND=""
RDEPEND="
|| (
		=dev-lang/perl-5.18*
		=dev-lang/perl-5.16*
		~perl-core/Dumpvalue-${PV}
)
"