# python

## pyenv install

```bash
brew install pyenv

echo 'eval "$(pyenv init -)"' >> ~/.zshrc

source ~/.zshrc
```

## pyenv shell

```bash
pyenv install --list

pyenv install 3.12.8

pyenv versions

pyenv global 3.12.8

pyenv shell 3.12.8

python --version
```

## pygame

```bash
# pip3 install pygame
pip3 install pygame==2.0.0.dev6

python3 -m pygame.examples.aliens
```
