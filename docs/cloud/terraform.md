# Terraform

## install

```bash
# OSX
brew update && brew install terraform
```

## terraformrc

```bash
vi ~/.terraformrc

plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"
disable_checkpoint = true
```

## usage

```bash
terraform init

terraform plan

terraform apply
terraform apply -var 'key=value'

terraform graph
terraform graph | dot -Tpng > graph.png
terraform graph | dot -Tsvg > graph.svg

terraform state rm module.foo

terraform destroy
terraform destroy -auto-approve
```

```bash
brew install graphviz
pip3 install blastradius

blast-radius --serve ./
```

## reference

* https://registry.terraform.io/browse?provider=aws
* https://github.com/terraform-aws-modules
* https://28mm.github.io/blast-radius-docs/
