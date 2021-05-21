# git

## config

```bash
git config --list

git config --global core.autocrlf input
git config --global core.pager ''
git config --global core.precomposeunicode true
git config --global core.quotepath false
git config --global pull.ff only

# git config --global pager.branch false
# git config --global pager.config false
# git config --global pager.tag false

git config --global user.name "nalbam"
git config --global user.email "me@nalbam.com"
```

## usage

```bash
git clone https://github.com/nalbam/nalbam-common.git

git remote add --track master upstream https://github.com/nalbam/nalbam-common.git

git fetch upstream

git add *
git commit -m 'message'
git push origin master
```

# tag

```bash
# new branch(v0.3.24-hotfix) from tag(v0.3.24)
git checkout -b v0.3.24-hotfix v0.3.24

# new tag
git tag v0.3.24-2
git push origin v0.3.24-2
```

## rebase

```bash
git log --pretty=oneline

git rebase -i HEAD~3

2,$s/pick/s/i

git rebase --continue
```

## repo move

```bash
git branch -a
git remote rm origin
git remote add origin git@github.com:<username>/<reponame>
git push origin --all
```

* <https://git-scm.com/book/ko/v2>
* <https://backlog.com/git-tutorial/kr/stepup/stepup7_5.html>

* <https://github.com/awslabs/git-secrets>
