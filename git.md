# git

## config

```
git config --list

git config --global core.autocrlf input
git config --global pager.config false
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

## rebase

```
git log --pretty=oneline

git rebase -i HEAD~3

2,$s/pick/s/i

git rebase --continue
```

* <https://git-scm.com/book/ko/v2>
* <https://backlog.com/git-tutorial/kr/stepup/stepup7_5.html>

* <https://github.com/awslabs/git-secrets>
