sudo rm -rf ~/.ipfs
sudo rm -rf /var/local/swarm.key

ipfs init

echo -e "/key/swarm/psk/1.0.0/\n/base16/\n`tr -dc 'a-f0-9' < /dev/urandom | head -c64`" > ~/.ipfs/swarm.key


# echo -e "/key/swarm/psk/1.0.0/\n/base16/\n91103cdcf9bb04dd3ff511859f447e53eb6f9a667774d9a28460ef1900bef812" > ~/.ipfs/swarm.key

sudo cp -a ~/.ipfs/swarm.key /var/local

ipfs bootstrap rm --all

ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
ipfs config show

ipfs bootstrap rm /ip4/23.96.46.70/tcp/4001/ipfs/QmXNj3UugaRGZUtR9JWPZuwYu44yAzNM4HopCgdVi3p5uk
ipfs bootstrap add /ip4/10.0.0.4/tcp/4001/ipfs/QmXNj3UugaRGZUtR9JWPZuwYu44yAzNM4HopCgdVi3p5uk


export LIBP2P_FORCE_PNET=1

sudo rm -rf /etc/systemd/system/ipfs.service

echo "[Unit]
 Description=IPFS Daemon
 After=syslog.target network.target remote-fs.target nss-lookup.target
 [Service]
 Type=simple
 ExecStart=/usr/local/bin/ipfs daemon --enable-namesys-pubsub
 User=$1
 [Install]
 WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/ipfs.service > /dev/null


sudo systemctl daemon-reload
sudo systemctl enable ipfs
sudo systemctl start ipfs
sudo systemctl status ipfs

