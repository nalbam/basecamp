# keygen

## ssh keygen

```bash
ssh-keygen -q -f ~/.ssh/id_rsa -N ''
```

## copy
```
scp s1:/home/nalbam/.ssh/id_dsa.pub.s1 ~/.ssh/
scp ~/.ssh/id_dsa.pub.s2 s1:/home/nalbam/.ssh/

cd ~/.ssh/
rm -rf authorized_keys

cat id_dsa.pub.s1 >> authorized_keys
cat id_dsa.pub.s2 >> authorized_keys

chmod 700 authorized_keys
```
