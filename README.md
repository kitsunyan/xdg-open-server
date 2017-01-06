# xdg-open-server

xdg-open-server allows you to create a UNIX-domain socket server to pass requests to xdg-open.

This tool might be useful with Docker containers.

## Building and Installing

Run `make && sudo make install` to install application.

The application will be started with your XDG-compliant desktop environment.

## Using with Docker Containers

The following xdg-open script allows you to send data to your server:

```shell
#!/bin/sh
echo "$@" | socat - UNIX-CLIENT:/run/user/$UID/xdg-open-server/socket`echo $DISPLAY | sed -r 's/\\\\/\\\\\\\\/g' | sed -r 's/:/\\\\:/g'`
```

You can put this script to `/usr/local/bin` directory of your Docker container.

You should also share your socket directory to Docker container using `-v /run/user/$UID/xdg-open-server:/run/user/$UID/xdg-open-server:ro`.
