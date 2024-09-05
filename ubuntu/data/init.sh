username='user'
apt update
apt-get update
apt install -y sudo
apt install -y openssh-server
mkdir /run/sshd
/usr/sbin/sshd &
mkdir -p /data/home/$username
useradd $username
usermod -d /data/home/$username $username
chown -R $username:$username /data/home/$username
echo "${username}   ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "new user ${username} password"
passwd $username