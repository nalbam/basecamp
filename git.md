# git

## config 
```
git config --list

git config --global core.autocrlf input
git config --global pager.branch false

git config --global user.name "nalbam"
git config --global user.email "me@nalbam.com"

git config --global user.name "Jungyoul Yu"
git config --global user.email "jungyoul.yu@bespinglobal.com"
```

## usage
```
git clone https://github.com/nalbam/nalbam-common.git

git remote add --track master upstream https://github.com/nalbam/nalbam-common.git

git fetch upstream

git add *
git commit -m 'message'
git push origin master
```

 * https://git-scm.com/book/ko/v1/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EC%B5%9C%EC%B4%88-%EC%84%A4%EC%A0%95
 * https://github.com/awslabs/git-secrets
