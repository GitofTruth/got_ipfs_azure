# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Basic Linux Stuff
apt-get install -y git

# install golang
GOREL=go1.13.3.linux-amd64.tar.gz
wget -q https://dl.google.com/go/$GOREL
tar xfz $GOREL
mv go /usr/local/go
rm -f $GOREL
PATH=$PATH:/usr/local/go/bin
echo 'PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.bashrc


# IPFS
curl -LO https://dist.ipfs.io/go-ipfs/v0.4.23/go-ipfs_v0.4.23_linux-amd64.tar.gz
tar -zxvf go-ipfs_v0.4.23_linux-amd64.tar.gz
sudo mv go-ipfs/ipfs /usr/local/bin/


# #add peer5 user
# useradd -m -s /bin/bash -U peer5 -u 666 
# cp -pr /home/vagrant/.ssh /home/peer5/
# chown -R peer5:peer5 /home/peer5
# echo "%peer5 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/peer5

#Install IPFS CLUSTER
cd ~
wget https://dist.ipfs.io/ipfs-cluster-service/v0.12.1/ipfs-cluster-service_v0.12.1_linux-amd64.tar.gz
tar xvfz ipfs-cluster-service_v0.12.1_linux-amd64.tar.gz
cd ipfs-cluster-service
sudo cp ipfs-cluster-service /usr/local/bin

cd ~
wget https://dist.ipfs.io/ipfs-cluster-ctl/v0.12.1/ipfs-cluster-ctl_v0.12.1_linux-amd64.tar.gz
tar xvfz ipfs-cluster-ctl_v0.12.1_linux-amd64.tar.gz
cd ipfs-cluster-ctl
sudo cp ipfs-cluster-ctl /usr/local/bin


#Peer joins ipfs private network
# IPFS_PATH=/home/peer5/.ipfs ipfs init
# echo -e "/key/swarm/psk/1.0.0/\n/base16/\n91103cdcf9bb04dd3ff511859f447e53eb6f9a667774d9a28460ef1900bef812" > ~/.ipfs/swarm.key
# IPFS_PATH=/home/peer5/.ipfs ipfs bootstrap rm --all
# IPFS_PATH=/home/peer5/.ipfs ipfs config show

# IPFS_PATH=/home/peer5/.ipfs ipfs bootstrap add /ip4/192.168.33.10/tcp/4001/ipfs/QmdDuTgruwB19LZJsNAc3kfoJf8FBw5ZDKG2fAAWJbUUSZ

# export LIBP2P_FORCE_PNET=1

# chown -R peer5:peer5 /home/peer5/.ipfs 

# IPFS_PATH=/home/peer5/.ipfs ipfs daemon &

# mkdir ipfstest
# cd ipfstest
# echo "Hello World!" > file1.txt
# IPFS_PATH=/home/peer5/.ipfs  ipfs add file1.txt


# #Peer joins cluster
# export CLUSTER_SECRET=220158bf2e0aae7d932ac0f4aa2a52b8041eb0915a6c5f9097bd1f40dae8ef82
# echo $CLUSTER_SECRET

# ipfs-cluster-service init
# ipfs-cluster-service daemon --bootstrap /ip4/192.168.33.10/tcp/9096/ipfs/12D3KooWMWTuvVFP39MuRF5zkThCWRygYWfs9dEtVHEnAnbwqkVT

