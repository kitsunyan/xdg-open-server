# xdg-open-server

xdg-open-server allows you to create a UNIX-domain socket server to pass requests to xdg-open.

This tool might be useful with Docker containers.

## Building and Installing

Run `make && sudo make install` to install the application. You can specify `PREFIX` variable
in order to change install location. For instance, `make PREFIX=/usr install`.

Pacman-based distributions users can make a package using provided `PKGBUILD` file
(set `XOS_LOCAL` environment variable for local building).

The application will be started with your XDG-compliant desktop environment.

To automatically start the application in i3, add the following line to your to your `~/.i3/config`:

```sh
exec --no-startup-id xdg-open-server &
```

## Using with Docker Containers

A client script allowing you to send data to your server is installed at
`$PREFIX/lib/xdg-open-server/xdg-open` (`/usr/lib/xdg-open-server/xdg-open` if installing
from `PKGBUILD`). Install this script in the `/usr/local/bin` directory of your Docker image.
The client script depends on the `socat` utility.

You should also share your socket directory to Docker container using
`-v "${XDG_RUNTIME_DIR}/xdg-open-server:${XDG_RUNTIME_DIR}/xdg-open-server:ro"`.
If the user ID in your container environment differs from your own user ID,
adjust the mount point accordingly.

If you are unable to alter your Docker image, you can mount the client script
and `socat` binary into the container as shown below:

```sh
docker run --name my_container \
  -v "${XDG_RUNTIME_DIR}/xdg-open-server:${XDG_RUNTIME_DIR}/xdg-open-server:ro" \
  -v /usr/share/xdg-open-server/xdg-open.sh:/usr/bin/xdg-open:ro \
  -v /bin/socat:/bin/socat \
  my_image
```
