# keygen

## ssh keygen

```bash
ssh-keygen -q -t ed25519 -f ~/.ssh/id_ed25519 -N ''
```

## copy

```
scp s1:/home/nalbam/.ssh/id_ed25519.pub.s1 ~/.ssh/
scp ~/.ssh/id_ed25519.pub.s2 s1:/home/nalbam/.ssh/

cd ~/.ssh/
rm -rf authorized_keys

cat id_ed25519.pub.s1 >> authorized_keys
cat id_ed25519.pub.s2 >> authorized_keys

chmod 700 authorized_keys
```
