# podman

## prepare

```bash
# Install Xcode command line tools
xcode-select --install

# Install necessary packages for building
brew install autoconf automake gettext glib libffi ninja pixman pkg-config
```

## qemu

```bash
# Clone qemu
git clone https://github.com/qemu/qemu
cd qemu

# Checkout to commit dated June 03, 2021 v6.0.0
git checkout 3c93dfa42c394fdd55684f2fbf24cf2f39b97d47

# Apply patch series v8 by Alexander Graf
curl -sL https://patchwork.kernel.org/series/485309/mbox/ | git am

# Building qemu installer
mkdir build && cd build
../configure --target-list=aarch64-softmmu --enable-hvf --enable-cocoa --disable-gnutls
sudo make install

# Cleaning up
cd ../../ && rm -rf qemu

for f in /usr/local/bin/qemu* ; do ; ln -s -f $f /opt/homebrew/bin ; done
```

## podman

```bash
brew install podman

podman machine start
```

## resources

* <https://github.com/containers/podman>
* <https://github.com/qemu/qemu>
* <https://www.cloudassembler.com/post/podman-machine-mac-m1/>
* <https://gist.github.com/nrjdalal/e70249bb5d2e9d844cc203fd11f74c55>
* <https://github.com/simnalamburt/homebrew-x>
