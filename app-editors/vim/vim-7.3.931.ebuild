# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/vim/vim-7.3.931.ebuild,v 1.1 2013/05/08 08:46:15 radhermit Exp $

EAPI=5
VIM_VERSION="7.3"
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} )
inherit vim

VIM_ORG_PATCHES="vim-patches-${PV}.patch.bz2"

SRC_URI="ftp://ftp.vim.org/pub/vim/unix/vim-${VIM_VERSION}.tar.bz2
	http://dev.gentoo.org/~lack/vim/${VIM_ORG_PATCHES}
	http://dev.gentoo.org/~radhermit/vim/${VIM_ORG_PATCHES}"

DESCRIPTION="Vim, an improved vi-style text editor"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~ia64-hpux ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

S=${WORKDIR}/vim${VIM_VERSION/.}

src_prepare() {
	vim_src_prepare

	if [[ ${CHOST} == *-interix* ]]; then
		epatch "${FILESDIR}"/${PN}-7.3-interix-link.patch
	fi
	epatch "${FILESDIR}"/${PN}-7.1.285-darwin-x11link.patch

	# fix python3 support
	epatch "${FILESDIR}"/${PN}-python3.patch
}