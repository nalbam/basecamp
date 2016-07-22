==== Deploy ====
<code>
cd /data/webapp/app

wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

t 00 init
t 00 deploy jenkins
</code>

==== Plugin ====
<code>
Maven Integration plugin

Android Emulator Plugin
Environment Injector Plugin

</code>

==== Android ====
<code>
sudo yum install -y libGL.so.1 glx-utils zlib.i686

tar zxvf android-sdk_r24.4.1-linux.tgz

android-sdk-linux/tools/android update sdk --no-ui

android-sdk-linux/tools/android list sdk -a
android-sdk-linux/tools/android update sdk -a -u -t 4

ANDROID_HOME=/data/apps/android-sdk-linux

clean assemble
</code>

==== Mail ====
<code>
smtphost = 'smtp.gmail.com'
smtpport = 465
use_ssl  = true

username = 'mon@smartforge.kr'
password = 'password'
</code>
