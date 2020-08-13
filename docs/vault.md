# vault

## token

```
Unseal Key 1: AKDZTLiAwTICzADnxI8CB7yYrdbwlrzTPcnzk+XSyu1h
Unseal Key 2: YZMnQ5DMPdoDWgQ+BqhSnqXjTEXP4g+s8ebJxKlShIVR
Unseal Key 3: RSNuSbXhYbQLcykY5QNxGI/d3gG/lXlx3taRt561vm9k
Unseal Key 4: Y9Lkt7+kii+OV/wydZEiMHc63aaqAcaR57cjqy5v/YlL
Unseal Key 5: qclSM1W2np4rjseXiDCP15A6PvYFqe7ldCGL9BUp2uET

Initial Root Token: s.OsmAjPY4fGcKIHnJSYJrd7Yz
```

```
Unseal Key 1: 4qc9A8A0GIH56FpJOBEUgXHvu+D2QnETKyVLVzwQqzB0
Unseal Key 2: jDJYMY2RtXfVmoYd6F1Gtv6YI6Dw6GA3dXOYhRD7WCHy
Unseal Key 3: ++9WtKzJ1aE5o18lXNXWW8leFI93w5R6A6f0anSauvSA
Unseal Key 4: w1S7zOfJ2JsAxFXF+euscwYJK5/u70IloIXiONyHbCoa
Unseal Key 5: i8iHdviX6980g+fXIBv5CUKDNh+w7VbZ2BGHx4q54o+0

Initial Root Token: s.v0gKPAHEmorcc2nvvqb7boYZ
```

## usage

```bash
k port-forward $(k get pod -n vault | grep vault | head -1 | cut -d' ' -f1) 8200 -n vault
k logs $(k get pod -n vault | grep vault | head -1 | cut -d' ' -f1) -n vault -f

export VAULT_ADDR='http://[::]:8200'
export VAULT_TOKEN="s.OsmAjPY4fGcKIHnJSYJrd7Yz"

vault status
vault operator init
vault operator unseal
vault login s.OsmAjPY4fGcKIHnJSYJrd7Yz

vault kv put secret/hello foo=world
vault kv get secret/hello -format=json | jq .
```
