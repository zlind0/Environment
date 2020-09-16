sudo apt update
sudo apt install -y unzip tmux python3-pip

sudo iptables -I INPUT -j ACCEPT
sudo iptables -I OUTPUT -j ACCEPT
sudo iptables -I FORWARD -j ACCEPT

pip3 install shadowsocks
sed -i "s/cleanup/reset/g" /home/ubuntu/.local/lib/*/site-packages/shadowsocks/crypto/openssl.py
nohup ssserver -k hzloraclenube -p 2333 -q &>/dev/null &

wget -N --no-check-certificate -q -O install.sh "https://raw.githubusercontent.com/wulabing/V2Ray_ws-tls_bash_onekey/dev/install.sh" 
chmod +x install.sh && sudo bash install.sh

# install v2ray
# curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
# sudo bash install-release.sh

# install bbr
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh