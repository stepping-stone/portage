# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/service-manager/service-manager-0.ebuild,v 1.3 2013/07/19 13:57:13 williamh Exp $

DESCRIPTION="Virtual for various service managers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd"
IUSE="kernel_linux"

RDEPEND="!kernel_linux? ( sys-apps/openrc )
	kernel_linux? (
		|| ( sys-apps/openrc
			sys-apps/systemd
			sys-process/runit
			virtual/daemontools )
	)"
DEPEND=""