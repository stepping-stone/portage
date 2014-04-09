# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/bcrypt/bcrypt-1.0.2.ebuild,v 1.3 2014/03/31 20:27:30 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy pypy2_0 )

inherit distutils-r1

DESCRIPTION="Modern password hashing for software and servers"
HOMEPAGE="https://github.com/dstufft/bcrypt/"
SRC_URI="https://github.com/pyca/bcrypt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE="test"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	 test? ( dev-python/pytest[${PYTHON_USEDEP}] )"
RDEPEND=">=dev-python/cffi-0.8[${PYTHON_USEDEP}]
	!dev-python/py-bcrypt"
DISTUTILS_IN_SOURCE_BUILD=1

python_test() {
	esetup.py test
}