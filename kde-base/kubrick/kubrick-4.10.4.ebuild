# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kubrick/kubrick-4.10.4.ebuild,v 1.5 2013/07/02 08:07:08 ago Exp $

EAPI=5

KDE_HANDBOOK="optional"
OPENGL_REQUIRED="always"
inherit kde4-base

DESCRIPTION="A game based on the \"Rubik's Cube\" puzzle."
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND="$(add_kdebase_dep libkdegames)
	virtual/glu
"
DEPEND="${RDEPEND}
	virtual/opengl
"