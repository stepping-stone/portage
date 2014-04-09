# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/builder/builder-3.2.2.ebuild,v 1.3 2014/02/12 07:22:20 graaff Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_TEST="test_all"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGES"

inherit ruby-fakegem eutils versionator

DESCRIPTION="A builder to facilitate programatic generation of XML markup"
HOMEPAGE="http://rubyforge.org/projects/builder/"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/rdoc )"

all_ruby_prepare() {
	sed -i \
		-e '/rdoc\.template .*jamis/d' \
		Rakefile || die

	rm rakelib/* || die
}