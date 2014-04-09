# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-dialup/sendpage/sendpage-1.1.0-r2.ebuild,v 1.2 2013/09/10 06:52:22 pinkbyte Exp $

EAPI=5

inherit perl-module eutils user

MY_P=${PN}-1.001
DESCRIPTION="Dialup alphapaging software."
HOMEPAGE="http://www.sendpage.org/"
SRC_URI="http://www.sendpage.org/download/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
# This package warrants IUSE doc
IUSE=""

DEPEND="!net-misc/hylafax
	>=dev-perl/Device-SerialPort-0.13
	>=dev-perl/MailTools-1.44
	>=virtual/perl-libnet-1.11
	>=dev-perl/Net-SNPP-1.13
	dev-perl/DBI"
RDEPEND="${DEPEND}"

mydoc="FEATURES email2page.conf sendpage.cf snpp.conf"

pkg_setup() {
	enewgroup sms
	enewuser sendpage -1 -1 /var/spool/sendpage sms
}

PATCHES=( "${FILESDIR}"/${PV}-makefile.patch )

src_install() {
	perl-module_src_install
	insinto /etc
	doins sendpage.cf
	newinitd "${FILESDIR}"/sendpage.initd sendpage
	diropts -o sendpage -g sms -m0770
	keepdir /var/spool/sendpage
	# Separate docs/ content from ${mydoc[@]}
	docompress -x /usr/share/doc/${PF}/text/
	docinto text/
	dodoc docs/*
}