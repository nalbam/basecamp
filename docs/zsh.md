# zsh

## zsh for linux

```bash
yum -y install zsh

chsh -s /bin/zsh
```

## zsh for mac

```bash
brew install zsh

chsh -s /bin/zsh
```

## oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

vi ~/.zshrc

# ZSH_THEME="dpoggi"

source ~/.zshrc
```

## plugin

```bash
brew install kube-ps1
brew install zsh-syntax-highlighting
```

```bash
# vi ~/.zshrc

if [ -f ~/.toast_aliases ]; then
  source ~/.toast_aliases
fi

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

#eval "$(pyenv init -)"

source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

* <https://draculatheme.com/iterm/>
