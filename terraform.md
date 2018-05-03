## install
```
# OSX
brew update && brew install terraform

# Linux
VERSION="0.11.7"
wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip
unzip terraform_${VERSION}_linux_amd64.zip
mv terraform /usr/local/bin/terraform
```
* https://www.terraform.io/downloads.html

## usage
```
terraform init

terraform plan

terraform apply
terraform apply -var 'key=value'

terraform graph
terraform graph | dot -Tpng > graph.png

terraform state rm module.foo

terraform destroy
terraform destroy -auto-approve
```

## reference
* https://github.com/terraform-aws-modules
