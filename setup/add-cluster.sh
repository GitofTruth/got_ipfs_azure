
rm -rf ~/.ipfs-cluster
sudo kill -9 $(sudo lsof -t -i:9094)
#Peer joins cluster
export CLUSTER_SECRET=220158bf2e0aae7d932ac0f4aa2a52b8041eb0915a6c5f9097bd1f40dae8ef82
echo $CLUSTER_SECRET

ipfs-cluster-service init
ipfs-cluster-service daemon --bootstrap /ip4/23.96.46.70/tcp/9096/ipfs/12D3KooWD6dvj7uoQ5hFwE79WKkE9jeMGLdX6GwrZZ9eV5pRyScM

sudo rm -rf /etc/systemd/system/ipfs-cluster.service

echo "[Unit]
Description=IPFS-Cluster Daemon
After=syslog.target network.target remote-fs.target nss-lookup.target
[Service]
Type=simple
ExecStart=/usr/local/bin/ipfs-cluster-service daemon
User=$1
[Install]
WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/ipfs-cluster.service > /dev/null


sudo systemctl daemon-reload
sudo systemctl enable ipfs-cluster
sudo systemctl start ipfs-cluster
sudo systemctl status ipfs-cluster
