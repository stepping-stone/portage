# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ml/kaputt/kaputt-1.1.ebuild,v 1.1 2011/03/04 13:00:32 aballier Exp $

EAPI=3

inherit findlib

DESCRIPTION="Unit testing tool for the Objective Caml language"
HOMEPAGE="http://kaputt.x9c.fr/"
SRC_URI="http://kaputt.x9c.fr/distrib/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/ocaml-3.11[ocamlopt]"
RDEPEND="${DEPEND}"

src_configure() {
	chmod +x configure
	./configure || die
}

src_compile() {
	emake all || die
}

src_test() {
	emake -j1 tests || die
}

src_install() {
	findlib_src_install
	dodoc README FEATURES CHANGES || die
}