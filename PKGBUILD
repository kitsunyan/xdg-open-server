pkgname=xdg-open-server
pkgver=1.3
pkgrel=1
pkgdesc='xdg-open portal for Docker containers'
arch=('i686' 'x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('MIT')
depends=('libx11' 'xdg-utils')
optdepends=('socat: xdg-open client script support')

# set XOS_LOCAL envvar to build the package from current directory
[ -n "${XOS_LOCAL}" ] && {
  source=()
  sha256sums=()
} || {
  source=("git+$url.git")
  sha256sums=('SKIP')
}

_make_flags=(PREFIX=/usr SYSCONFDIR=/etc)

prepare() {
  if [ -n "${XOS_LOCAL}" ]; then
    rm -rf "$srcdir/$pkgname"
    mkdir "$srcdir/$pkgname"

    (cd "$startdir" && find . -mindepth 1 -maxdepth 1 \
    -not -name '.git' -and -not -name 'src' -and -not -name 'pkg' -print0) |
    xargs -0 -n 1 -I {} cp -rpv "$startdir/{}" "$srcdir/$pkgname/{}"
  else
    true
  fi
}

build() {
  cd "$srcdir/$pkgname"
  make "${_make_flags[@]}"
}

package() {
  cd "$srcdir/$pkgname"
  make "${_make_flags[@]}" DESTDIR="$pkgdir" install
}
