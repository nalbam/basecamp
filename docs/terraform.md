# Terraform

## install

```bash
# OSX
brew update && brew install terraform
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
pip3 install blastradius
brew install graphviz

tfg > graph.json
cat graph.json | dot -Tsvg > graph.svg
```

## reference

* https://registry.terraform.io/browse?provider=aws
* https://github.com/terraform-aws-modules
* https://28mm.github.io/blast-radius-docs/
