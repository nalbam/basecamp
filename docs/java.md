# java

## AdoptOpenJDK 8

```bash
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
```

## jenv

```bash
brew install jenv

echo 'export PATH=$PATH:$HOME/.jenv/bin' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc

source ~/.zshrc

jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
# jenv add /Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home

jenv global 1.8

# jenv local 1.8
```
