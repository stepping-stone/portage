# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Digest-SHA/Digest-SHA-5.850.0.ebuild,v 1.1 2013/08/03 04:59:23 mattst88 Exp $

EAPI=5

MODULE_AUTHOR=MSHELOR
MODULE_VERSION=5.85
inherit perl-module

DESCRIPTION="Perl extension for SHA-1/224/256/384/512"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"

DEPEND="test? (
	dev-perl/Test-Pod
	dev-perl/Test-Pod-Coverage
)"

SRC_TEST="do"