# This script downloads sibench, adds it to your path, configures it as a systemd service and starts it.
# Todo:
	# currently it downloads a fixed release, ideally it will dynamically grab the latest

wget https://github.com/SoftIron/sibench/releases/download/1.1.4/sibench-amd64-1.1.4.tar.gz -O /tmp/sibench-amd64-1.1.4.tar.gz
tar xf /tmp/sibench-amd64-1.1.4.tar.gz
cp sibench /usr/bin
wget https://raw.githubusercontent.com/SoftIron/sibench/master/lib/systemd/system/sibench.service -O /etc/systemd/system/sibench.service
chown root:root /etc/systemd/system/sibench.service
chmod a+x /etc/systemd/system/sibench.service
systemctl daemon-reload
systemctl start sibench.service
sleep 3
systemctl status sibench.service
