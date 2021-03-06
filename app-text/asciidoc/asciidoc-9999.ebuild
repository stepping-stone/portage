# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 pypy )

[ "$PV" == "9999" ] && inherit git-r3 autotools
inherit readme.gentoo-r1 python-single-r1

DESCRIPTION="AsciiDoc is a plain text human readable/writable document format"
HOMEPAGE="http://www.methods.co.nz/asciidoc/"
if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="https://github.com/asciidoc/asciidoc.git"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${PV}/${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="examples graphviz highlight test"

REQUIRED_USE="highlight? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND=">=app-text/docbook-xsl-stylesheets-1.75
		dev-libs/libxslt
		graphviz? ( media-gfx/graphviz )
		app-text/docbook-xml-dtd:4.5
		highlight? ( || ( dev-util/source-highlight \
			dev-python/pygments[${PYTHON_USEDEP}] \
			app-text/highlight )
		)
		${PYTHON_DEPS}
"
DEPEND="test? ( dev-util/source-highlight
			media-sound/lilypond
			media-gfx/imagemagick
			dev-texlive/texlive-latex
			app-text/dvipng
			media-gfx/graphviz
			${PYTHON_DEPS} )
"

DOC_CONTENTS="
If you are going to use a2x, please also look at a2x(1) under
REQUISITES for a list of runtime dependencies.
"

if [ "$PV" == "9999" ]; then
	DEPEND="${DEPEND}
		www-client/lynx
		dev-util/source-highlight"
fi

src_prepare() {
	default

	# Only needed for prefix - harmless (does nothing) otherwise
	sed -i -e "s:^CONF_DIR=.*:CONF_DIR='${EPREFIX}/etc/asciidoc':" \
		"${S}/asciidoc.py" || die

	[ "$PV" == "9999" ] && eautoconf
}

src_configure() {
	econf --sysconfdir="${EPREFIX}"/usr/share
}

src_compile() {
	default

	if [ "$PV" == "9999" ]; then
		# replicate build rules from doc/main.aap; this avoids a dependency on
		# the A-A-P build tool
		for f in CHANGELOG.txt BUGS.txt README.asciidoc; do
			${PYTHON} asciidoc.py -f text.conf -n -b html4 -o - "$f" | \
				lynx -dump -stdin > "${f%.*}" || die
		done
	fi
}

src_install() {
	emake DESTDIR="${D}" install

	python_fix_shebang "${ED}"/usr/bin/*.py

	if use examples; then
		# This is a symlink to a directory
		rm examples/website/images || die

		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
		dosym ../../../asciidoc/images /usr/share/doc/${PF}/examples
	fi

	readme.gentoo_create_doc
	dodoc BUGS CHANGELOG README docbook-xsl/asciidoc-docbook-xsl.txt \
			dblatex/dblatex-readme.txt filters/code/code-filter-readme.txt
}

src_test() {
	local -x ASCIIDOC_PY=asciidoc.py
	"${PYTHON}" tests/test${PN}.py update || die
	"${PYTHON}" tests/test${PN}.py run || die
}

pkg_postinst() {
	readme.gentoo_print_elog
}
