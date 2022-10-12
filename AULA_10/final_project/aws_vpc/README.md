# AWS VPC Module

Esse modulo facilita a criacao de aws_vpc

- `aws_vpc`

# Compability

This module is meant for use with Terraform 0.13+ and teststed using Terraform 1.0+.

## Usage

You can go to the example:

```hcl
module "aws_vpc" {
  source     = "git@github.com:dihogoteixeira/aws_vpc_module?ref=0.1.0"
  cidr_block = "10.0.0.0/16"
}
```

Then perform the follwing commands on the root folder: 

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy`to destroy the build infrastructure

## Inputs

### Required

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|cidr_block|VPC cidr block ex.: 10.10.0.0/16|string|true|yes|

### Opitional

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|tags|to tag environments on resources|map(string)|true| no|


## Outputs

- `name` Return the nam of instance

```hcl
output "id" {
  value = module.aws_vpc.id
}
```