Docker for Bitcoind Fibre v0.14.1 FIBRE 0.7
===================================

* OS: `Ubuntu 16.04 LTS`
* Docker Image OS: `Ubuntu 16.04 LTS`
* `Fibre`
  * `https://github.com/bitcoinfibre/bitcoinfibre/archive/v0.14.1-fibre0.7.tar.gz`
  * `https://github.com/bitcoinfibre/bitcoinfibre/releases`

## Install Docker
```
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
Docker for Bitcoind Fibre v0.14.1 FIBRE 0.7
===================================

* OS: `Ubuntu 16.04 LTS`
* Docker Image OS: `Ubuntu 16.04 LTS`
* `Fibre`
  * `https://github.com/bitcoinfibre/bitcoinfibre/archive/v0.14.1-fibre0.7.tar.gz`
  * `https://github.com/bitcoinfibre/bitcoinfibre/releases`

## Install Docker
```
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

service docker start
service docker status

```

## Build Docker Images

```
mkdir /root/source
cd /root/source

git clone https://github.com/xianxiongwang/fibre_docker.git
cd fibre_docker/v0.14.1

# if you install nodes in China, please check "Dockerfile" and uncomment some lines

# build
docker build -t fibre-bitcoind:v0.14.1 .
# docker build --no-cache -t fibre-bitcoind:v0.14.1 .

# mkdir for bitcoind
mkdir -p /work/bitcoind

# bitcoin.conf
touch /work/bitcoind/bitcoin.conf
```

### bitcoin.conf example

```
rpcuser=bitcoinrpc
# generate random rpc password:
#   $ strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo
rpcpassword=xxxxxxxxxxxxxxxxxxxxxxxxxx
rpcthreads=4

rpcallowip=172.17.0.0/16
rpcallowip=192.168.0.0/16
rpcallowip=10.0.0.0/8

# fibre udp port
udpport=8334,0,1024

# add fibre nodes
addtrustedudpnode=123.123.123.123:8334,random_string,random_string
addtrustedudpnode=123.123.123.123:8334,random_string,random_string
addtrustedudpnode=123.123.123.123:8334,random_string,random_string
```

## Start Docker Container

```
# start
docker run -it -v /work/bitcoind:/root/.bitcoin --name fibre-bitcoind -p 8333:8333 -p 8332:8332 -p 8334:8334/udp --restart always -d fibre-bitcoind:v0.14.1

# login
docker exec -it fibre-bitcoind /bin/bash
```

