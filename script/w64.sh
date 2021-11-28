#tested in ubuntu 20.04 and we need be able to compile with j10 or adapt
#------------------------------first we need update system
apt-get update -y
apt-get ugrade -y
#------------------------------install dependencies
apt install git
sudo apt-get install build-essential libtool bsdmainutils autotools-dev autoconf pkg-config automake python3 -y
sudo apt-get install libgmp-dev libevent-dev libboost-all-dev libsodium-dev cargo -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:pivx/pivx -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt install libminiupnpc-dev libnatpmp-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 libqt5svg5-dev libqt5charts5-dev qttools5-dev qttools5-dev-tools libqrencode-dev -y
sudo apt install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git -y
sudo apt install g++-mingw-w64-x86-64 -y
#-------------------------------we need choose the * 1 (/usr/bin/x86_64-w64-mingw32-g++-posix)
sudo update-alternatives --config x86_64-w64-mingw32-g++
#-------------------------------clone the repo
git clone https://github.com/Crypto-city/Element-HYP.git
cd Element-HYP/depends/
#--------------------------------compile deps
make HOST=x86_64-w64-mingw32 -j10
cd ..
#--------------------------------compile cores
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
sudo make -j10
