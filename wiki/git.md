### 설정 
```
git config --global user.name "nalbam-me"
git config --global user.email "me@nalbam.com"

git config --global user.name "nalbam-ya"
git config --global user.email "jyyu@yanolja.in"

git config --global core.eol lf

git config --list
```

### 사용법 
```
git clone https://github.com/nalbam/nalbam-common.git

git remote add --track master upstream https://github.com/nalbam/nalbam-common.git

git fetch upstream

git add *
git commit -m 'message'
git push origin master
```

 * https://git-scm.com/book/ko/v1/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EC%B5%9C%EC%B4%88-%EC%84%A4%EC%A0%95
