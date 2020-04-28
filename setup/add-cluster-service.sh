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