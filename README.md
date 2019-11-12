Balena OS docker base image
===========================

This image will install an operating system ready to build Balena OS.

# Build:

```
export RELEASE=warrior
docker build -t docker-balena:$RELEASE --build-arg FSL_BRANCH=$RELEASE --no-cache .
```

# Use:
* Prepare you balena project on your host, for example:
```
cd /build
git clone --recursive https://github.com/balena-os/balena-intel.git
```

* Pass the build directory (/build/balena-intel above) as /home/build on a volume

* Use the container to build your project:

```
docker run --rm -it --privileged -v /build/balena-intel:/home/build aggurio/docker-balena
```

By default the containter runs on the /home/build directory and runs;
```
./balena-yocto-barys/scripts/barys --rm-work -d
```

You can override the command to suit your needs:
```
docker run --rm -it --privileged -v /build:/home/build aggurio/docker-balena ./balena-yocto-barys/scripts/barys
```
