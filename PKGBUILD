pkgname=xdg-open-server
pkgver=1.1
pkgrel=1
pkgdesc="xdg-open portal for Docker containers"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'xdg-utils')
optdepends=('socat: xdg-open.sh client script support')
source=('git://github.com/kitsunyan/xdg-open-server.git')
sha256sums=('SKIP')

prepare() {
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
