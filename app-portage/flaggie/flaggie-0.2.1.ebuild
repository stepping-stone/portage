# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-portage/flaggie/flaggie-0.2.1.ebuild,v 1.1 2013/05/24 14:42:07 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} pypy{1_8,1_9} )

inherit bash-completion-r1 distutils-r1

DESCRIPTION="A smart CLI mangler for package.* files"
HOMEPAGE="https://bitbucket.org/mgorny/flaggie/"
SRC_URI="mirror://bitbucket/mgorny/${PN}/downloads/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~mips ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=">=sys-apps/portage-2.1.8.3"

python_install_all() {
	newbashcomp contrib/bash-completion/${PN}.bash-completion ${PN}
	distutils-r1_python_install_all
}

pkg_postinst() {
	ewarn "Please denote that flaggie creates backups of your package.* files"
	ewarn "before performing each change through appending a single '~'."
	ewarn "If you'd like to keep your own backup of them, please use another"
	ewarn "naming scheme (or even better some VCS)."
	elog
	elog "bash-completion support requires:"
	elog "	app-shells/gentoo-bashcomp"
	has_version app-shells/gentoo-bashcomp && \
		elog "(installed already)"
}