pkgname=xdg-open-server
pkgver=1.1
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

prepare() {
  [ -n "${XOS_LOCAL}" ] && {
    rm -rf "$srcdir/$pkgname"
    mkdir "$srcdir/$pkgname"

    (cd "$startdir" && find . -mindepth 1 -maxdepth 1 \
    -not -name '.git' -and -not -name 'src' -print0) |
    xargs -0 -n 1 -I {} cp -rpv "$startdir/{}" "$srcdir/$pkgname/{}"
  }

  cd "$srcdir/$pkgname"
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
