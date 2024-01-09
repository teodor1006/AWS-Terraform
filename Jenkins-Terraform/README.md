# Terraform: Provisioning an EC2 Instance with Jenkins

## Prerequisites

* AWS Account with AdministratorAccess configured
* Terraform installed
* Created keypair. Make sure to put the name of your keypair in `main.tf` under `key_name = ...`!!

## Start the EC2 Instance by running the following commands in your console:

```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
Wait a little bit in order the EC2 instance to get started!

## Remove the EC2 Instance

```
terraform destroy -auto-approve
```

