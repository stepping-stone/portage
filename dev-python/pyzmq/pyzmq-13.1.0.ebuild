# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyzmq/pyzmq-13.1.0.ebuild,v 1.3 2013/05/08 18:14:17 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="PyZMQ is a lightweight and super-fast messaging library built on top of the ZeroMQ library"
HOMEPAGE="http://www.zeromq.org/bindings:python http://pypi.python.org/pypi/pyzmq"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="examples green test"

PY2_USEDEP=$(python_gen_usedep 'python2*')

RDEPEND=">=net-libs/zeromq-2.1.9
	green? ( dev-python/gevent[${PY2_USEDEP}] )"
DEPEND="${RDEPEND}
	test? (
		!arm? ( dev-python/cffi[${PYTHON_USEDEP}] )
		dev-python/nose[${PY2_USEDEP}]
		dev-python/gevent[${PY2_USEDEP}]
		dev-python/cython[${PY2_USEDEP}]
	)"

# Configure checks write to cwd.
# https://github.com/zeromq/pyzmq/issues/318
DISTUTILS_IN_SOURCE_BUILD=1

REQUIRED_USE="test? ( !arm )"

python_test() {
	if [[ "${EPYTHON}" == python3* ]]; then
		einfo "Skipping python3 due to many incompatibilities"
	else
		nosetests -svw build/lib/ || die "Tests fail with ${EPYTHON}"
	fi
}

python_install_all() {
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}