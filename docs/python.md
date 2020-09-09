# python

## pyenv

```bash
brew install pyenv

echo 'eval "$(pyenv init -)"' >> ~/.zshrc

source ~/.zshrc
```

```bash
pyenv install --list

pyenv install 2.7.14
pyenv install 3.6.5
pyenv install 3.7.6

pyenv versions

# pyenv global 2.7.14 3.6.5 3.7.6

pyenv shell 2.7.14
pyenv shell 3.6.5
pyenv shell 3.7.6

python --version
```

## pygame

```bash
# pip3 install pygame
pip3 install pygame==2.0.0.dev6

python3 -m pygame.examples.aliens
```
