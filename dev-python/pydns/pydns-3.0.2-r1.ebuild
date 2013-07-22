# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pydns/pydns-3.0.2-r1.ebuild,v 1.1 2013/06/21 15:50:30 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{3_1,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python module for DNS (Domain Name Service)"
HOMEPAGE="http://pydns.sourceforge.net/ http://pypi.python.org/pypi/pydns"
SRC_URI="http://downloads.sourceforge.net/project/pydns/py3dns/${P/py/py3}.tar.gz"

LICENSE="CNRI"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="virtual/libiconv"
#should this have !dev-python/pydns:0 ?
RDEPEND=""

DOCS=( CREDITS )
# Funny a dns package attempts to use the network on tests
# Await the day that gentoo chills out on such a blanket law.
RESTRICT=test

S="${WORKDIR}/${P/py/py3}"

src_prepare() {
	# Don't compile bytecode.
	sed -i -e 's:^\(compile\|optimize\).*:\1 = 0:g' setup.cfg

	# cleanup docs
	rm -f -- "README-guido.txt"
	mv -f -- "README.txt" "README"
	mv -f -- "CREDITS.txt" "CREDITS"
}

python_test() {
	local test
	for test in tests/{test.py,test[2-5].py,testsrv.py}
	do
		"${PYTHON}" $test || die
	done
}

python_install_all(){
	use examples && local EXAMPLES=( ./{tests,tools}/. )
	distutils-r1_python_install_all
}