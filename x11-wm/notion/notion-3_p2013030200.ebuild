# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/notion/notion-3_p2013030200.ebuild,v 1.3 2013/05/29 06:32:20 xmw Exp $

EAPI="4"

inherit eutils toolchain-funcs multilib

DESCRIPTION="Notion is a tiling, tabbed window manager for the X window system"
HOMEPAGE="http://notion.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/files/${P/_p/-}-src.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls xinerama +xrandr"

RDEPEND="dev-lang/lua
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	nls? ( sys-devel/gettext )
	xinerama? ( x11-libs/libXinerama )
	xrandr? ( x11-libs/libXrandr )"

DEPEND="${RDEPEND}
		virtual/pkgconfig"

S=${WORKDIR}/${P/_p/-}

src_prepare() {
	sed -e "/^CFLAGS=/s:=:+=:" \
		-e "/^CFLAGS/{s:-Os:: ; s:-g::}" \
		-e "/^LDFLAGS=/{s:=:+=: ; s:-Wl,--as-needed::}" \
		-e "/^CC=/s:=:?=:" \
		-e "s:^\(PREFIX=\).*$:\1${ROOT}usr:" \
		-e "s:^\(ETCDIR=\).*$:\1${ROOT}etc/notion:" \
		-e "s:^\(LIBDIR=\).*:\1\$(PREFIX)/$(get_libdir):" \
		-e "s:^\(DOCDIR=\).*:\1\$(PREFIX)/share/doc/${PF}:" \
		-e "s:^\(LUA_DIR=\).*$:\1\$(PREFIX)/usr:" \
		-e "s:^\(VARDIR=\).*$:\1${ROOT}var/cache/${PN}:" \
		-e "s:^\(X11_PREFIX=\).*:\1\$(PREFIX)/usr:" \
		-i system-autodetect.mk || die
	sed -e 's/gcc/$(CC)/g' \
		-i ioncore/Makefile || die
	export STRIPPROG=true

	use nls || export DEFINES=" -DCF_NO_LOCALE -DCF_NO_GETTEXT"

	if ! use xinerama ; then
		sed -e 's/mod_xinerama//g' -i modulelist.mk || die
	fi

	if ! use xrandr ; then
		sed -e 's/mod_xrandr//g' -i modulelist.mk || die
	fi

	tc-export CC
}

src_compile() {
	emake CC="$(tc-getCC)" AR="$(tc-getAR)" \
		RANLIB="$(tc-getRANLIB)"
}

src_install() {
	emake DESTDIR="${D}" install

	exeinto /etc/X11/Sessions
	doexe "${FILESDIR}"/notion

	insinto /usr/share/xsessions
	doins "${FILESDIR}"/notion.desktop
}

pkg_postinst() {
	elog "If you want notion to have an ability to view a file based on its"
	elog "guessed MIME type you need 'run-mailcap' program in your system."
}