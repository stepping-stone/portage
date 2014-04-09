# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/seed-fu/seed-fu-2.2.0.ebuild,v 1.1 2013/12/13 11:15:08 mrueg Exp $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_DOCDIR="doc"

inherit ruby-fakegem

DESCRIPTION="Advanced seed data handling for Rails, combining the best practices of several methods together"
HOMEPAGE="https://github.com/mbleigh/seed-fu"
SRC_URI="https://github.com/mbleigh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/activerecord-3.1
	>=dev-ruby/activesupport-3.1"
ruby_add_bdepend "test? ( dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e '/bundler/d' spec/spec_helper.rb || die "sed failed"
}