
tar -xaf ssh.tgz
find home|grep id_rsa|xargs -n1 -I % mv % ~/.ssh
find home|grep config|xargs -n1 -I % mv % ~/.ssh
rm -rf home

sudo sed -i 's/cn.archive.ubuntu.com/mirrors.nju.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y gcc binutils build-essential git wget curl make autoconf zsh proxychains openssh-server
sudo sed -i "s/^socks4.*$/socks5 192.168.1.165 7890/g" /etc/proxychains.conf


#install anaconda
wget http://mirrors.nju.edu.cn/anaconda/archive/Anaconda3-2020.11-Linux-x86_64.sh
bash Anaconda3-2020.11-Linux-x86_64.sh

source ~/anaconda3/bin/activate
conda config --add channels https://mirrors.nju.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
proxychains conda install -c anaconda tensorflow-gpu ujson tqdm
