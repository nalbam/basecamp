=== 설치 ===
<code>
# yum -y groupinstall "Web Server"
</code>

=== 시작 ===
<code>
# service httpd restart
</code>

=== 자동시작 ===
<code>
# chkconfig httpd on
</code>

=== 설치경로 ===
<code>
/usr/lib64/httpd
/etc/httpd
</code>
