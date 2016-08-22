### zsh for linux ###
```
yum -y install zsh

chsh -s /bin/zsh
```

### zsh for mac ###
```
brew install zsh
sudo vim /etc/shells

/usr/local/bin/zsh

chsh -s /usr/local/bin/zsh

chsh -s /bin/zsh
```

### oh-my-zsh ###
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

vi .zshrc

ZSH_THEME="dpoggi"

source ~/.nalbam/zshrc.sh
```

### config ###
```
cd /data/work/nalbam

git clone git@github.com:nalbam/nalbam-shell.git

ln -s /data/work/nalbam/nalbam-shell/cygwin/.nalbam
ln -s /data/work/nalbam/nalbam-shell/linux/.nalbam

ln -s /Users/nalbam/work/nalbam/nalbam-shell/macos/.nalbam
```
