# Purpose

To remove docker from Flatcar entirely - by replacing the docker torcx with one that calls podman instead.
You will also need the podman sysext from [My Repo](https://github.com/goochjj/flatcar-podman-overlay) or [jepio's Repo](https://github.com/jepio/flatcar-podman-overlay)
Binary sysext [here](https://github.com/goochjj/flatcar-podman-overlay)


# Build

```
./build.sh
```

# Install

```
./install.sh
```


And reboot.

# Use

Once you reboot, docker should call podman.  It'll tell you that too, by putting `Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.` on the console.

Calling something like `dockerd` from the command line will tell you `The current torcx profile did not install a dockerd program.`.


