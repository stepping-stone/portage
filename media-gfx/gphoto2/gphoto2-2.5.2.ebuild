# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/gphoto2/gphoto2-2.5.2.ebuild,v 1.1 2013/08/03 18:11:15 eva Exp $

EAPI="5"

DESCRIPTION="free, redistributable digital camera software application"
HOMEPAGE="http://www.gphoto.org/"
SRC_URI="mirror://sourceforge/gphoto/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE="aalib exif ncurses nls readline"

# aalib -> needs libjpeg
# raise libgphoto to get a proper .pc
RDEPEND="
	dev-libs/popt
	>=media-libs/libgphoto2-2.5.0[exif?]
	virtual/libusb:0
	aalib? (
		media-libs/aalib
		virtual/jpeg:0 )
	exif? (	media-libs/libexif )
	ncurses? ( dev-libs/cdk )
	readline? ( sys-libs/readline )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( >=sys-devel/gettext-0.14.1 )
"

src_prepare() {
    # Leave GCC debug builds under user control
	sed -r '/(C|LD)FLAGS/ s/ -g( |")/\1/' \
		-i configure{.ac,} || die

}

src_configure() {
	CPPFLAGS="-I/usr/include/cdk" econf \
		--docdir=/usr/share/doc/${PF} \
		$(use_with aalib) \
		$(use_with aalib jpeg) \
		$(use_with exif libexif auto) \
		$(use_with ncurses cdk) \
		$(use_enable nls) \
		$(use_with readline)
}

src_install() {
	emake DESTDIR="${D}" \
		HTML_DIR="${D}"/usr/share/doc/${PF}/sgml \
		install

	dodoc ChangeLog NEWS* README AUTHORS
	rm -rf "${D}"/usr/share/doc/${PF}/sgml/gphoto2
}