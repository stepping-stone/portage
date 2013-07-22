# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/itsdangerous/itsdangerous-0.22.ebuild,v 1.1 2013/07/17 02:43:49 radhermit Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_3} pypy{1_9,2_0} )

inherit distutils-r1

DESCRIPTION="Various helpers to pass trusted data to untrusted environments and back."
HOMEPAGE="http://pythonhosted.org/itsdangerous/ http://pypi.python.org/pypi/itsdangerous"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"