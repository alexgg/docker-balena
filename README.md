Balena OS docker base image
===========================

This image will install an operating system ready to build [balenaOS](https://www.balena.io/os/).

# Build:

```
export RELEASE=warrior
docker build -t docker-balena:$RELEASE --no-cache .
```

# Use:
* Prepare your balena project on your host, for example:
```
cd /build
git clone --recursive https://github.com/balena-os/balena-intel.git
```

* Pass the build directory (/build/balena-intel above) as /home/build on a volume

* Use the container to build your project:

```
docker run --rm -it --privileged -v /build/balena-intel:/home/build aggurio/docker-balena
```

By default the container runs on the /home/build directory and runs;
```
./balena-yocto-scripts/build/barys --rm-work -d
```

You can override the command to suit your needs, for example, to build a single machine. Run `./balena-yocto-scripts/build/barys --help` to see all available options.
```
docker run --rm -it --privileged -v /build:/home/build aggurio/docker-balena ./balena-yocto-scripts/build/barys --rm-work -d --machine surface-go
```
