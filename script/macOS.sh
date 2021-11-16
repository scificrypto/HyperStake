#!/bin/bash
#------------Prepare the environment
echo @@@
echo @@@"Installing Dependecies"
echo @@@
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:pivx/pivx -y
sudo apt-get update -y
sudo apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" make software-properties-common \
build-essential libtool autoconf  libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev \
libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git wget curl libdb4.8-dev bsdmainutils libdb4.8++-dev \
libminiupnpc-dev libgmp3-dev ufw pkg-config libevent-dev  libdb5.3++ unzip libzmq5 libssl-dev
sudo apt install -y curl gcc-mingw-w64-i686 gcc-mingw-w64-base  imagemagick librsvg2-bin g++-mingw-w64-x86-64 nsis bc  binutils-arm-linux-gnueabihf g++-7-multilib gcc-7-multilib binutils-gold git pkg-config autoconf libtool automake bsdmainutils ca-certificates python g++ mingw-w64 g++-mingw-w64 nsis zip rename librsvg2-bin libtiff-tools cmake imagemagick libcap-dev libz-dev libbz2-dev python-dev python-setuptools fonts-tuffy
sudo apt-get install g++-mingw-w64-i686 -y
mkdir -p ~/release
cd .. && cd depends/

#------------Compile macOS depedencies
sudo mkdir SDKs
cd SDKs 
sudo wget -c https://github.com/phracker/MacOSX-SDKs/releases/download/MacOSX10.11.sdk/MacOSX10.11.sdk.tar.xz
sudo tar -xf MacOSX10.11.sdk.tar.xz
cd ..
sudo make HOST=x86_64-apple-darwin14 -j8
cd ..

#------------Compile macOS core
sudo make clean
sudo ./autogen.sh && sudo sudo ./configure --prefix=`pwd`/depends/x86_64-apple-darwin14 && sudo make -j8
sudo make deploy -j8

#------------Make install
sudo mkdir ~/release/Element-HYP-macOS/
sudo cp -r Element-Qt.dmg ~/release/Element-HYP-macOS/
echo "Finished, you could find the release in /root/release/Element-HYP-macOS"

