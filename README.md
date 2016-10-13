# PollardRho

### What is this?
Factoring program for the Fermat number F_8 (2**256+1) written in Swift using GMP module.
The factorization took a few minutes depending on your system speed.

### Build and Run
On macOS
```
brew install gmp
git clone https://github.com/tinysun212/PollardRho.git
cd PollardRho
swift build -c release -Xswiftc -I/usr/local/include -Xlinker -L/usr/local/lib
.build/release/PollardRho
```
On Linux (Ubuntu)
```
sudo apt-get install libgmp-dev
git clone https://github.com/tinysun212/PollardRho.git
cd PollardRho
swift build -c release
.build/release/PollardRho
```
On Cygwin
```
Install Libs/libgmp-devel with Cygwin installer
git clone https://github.com/tinysun212/PollardRho.git
cd PollardRho
swift build -c release
.build/release/PollardRho
```
You can download the Swift compiler at https://swift.org/download/ for Linux, https://github.com/tinysun212/swift-windows/releases for Cygwin.

### About the algorithm
See [here](https://en.wikipedia.org/wiki/Pollard%27s_rho_algorithm#Application).
