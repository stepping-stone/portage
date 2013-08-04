# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/term-ansicolor/term-ansicolor-1.2.2.ebuild,v 1.1 2013/07/29 02:35:41 mrueg Exp $

EAPI=5
USE_RUBY="ruby18 jruby ruby19"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_EXTRADOC="CHANGES README.rdoc"

RUBY_FAKEGEM_GEMSPEC="term-ansicolor.gemspec"

# don't install a cdiff wrapper, collides with app-misc/colordiff (bug
# #310073).
RUBY_FAKEGEM_BINWRAP="decolor"

inherit ruby-fakegem

DESCRIPTION="Small Ruby library that colors strings using ANSI escape sequences."
HOMEPAGE="http://term-ansicolor.rubyforge.org/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"

each_ruby_test() {
	${RUBY} -Ilib -Itests tests/* || die
}

all_ruby_install() {
	all_fakegem_install

	docinto examples
	dodoc examples/*
}