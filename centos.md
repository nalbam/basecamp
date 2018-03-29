## Desktop
```
yum -y update
yum -y groups install "GNOME Desktop" "Development Tools"
yum -y install kernel-devel

yum -y install epel-release
yum -y install dkms

reboot -n


reboot -n

echo "exec gnome-session" >> ~/.xinitrc

systemctl set-default graphical.target
```
 * http://www.advancedclustering.com/act_kb/installing-nvidia-drivers-rhel-centos-7/
