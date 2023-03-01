# aws

## amazon linux 2

### python 3.9

```bash
sudo yum install gcc openssl-devel bzip2-devel libffi-devel

wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tgz
sudo tar xzf Python-3.9.16.tgz

cd Python-3.9.16
sudo ./configure --enable-optimizations
sudo make altinstall

python3.9 --version
python3.9 -m venv env

source env/bin/activate
```
