## Desktop
```
yum -y update
yum -y groups install "GNOME Desktop" "Development Tools"
yum -y install kernel-devel

yum -y install epel-release
yum -y install dkms

echo "exec gnome-session" >> ~/.xinitrc

systemctl set-default graphical.target

reboot -n
```
 * http://www.advancedclustering.com/act_kb/installing-nvidia-drivers-rhel-centos-7/
