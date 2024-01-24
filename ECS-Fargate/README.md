# Provisioning AWS ECS Cluster + Service with Terraform

## Prerequisites

* AWS Account 
* Terraform installed and configured

## **Step 1: Create S3 Bucket**
* Go to `AWS S3` -> Create bucket -> Give it a unique name -> Keep the rest as default. Make sure to update the name of your bucket and region in the `backend_providers.tf` file. 

![bucket](images/bucket.png)

## **Step 2: Create ECR Repository**
* Go to `Amazon ECR` -> Create repository -> Give it a name (my name is `nginx-images`). Make sure to update the name of your ecr repo if you use a different name in the `ecs-taskdef.tf` file.

![repo](images/ecr-repo1.png)

## **Step 3: Create `terraform.tfvars` file** 

* It can look something like that:

```sh
region       = "us-east-1"
vpc_name     = "ECS-Fargate-VPC"
zone1        = "us-east-1a"
zone2        = "us-east-1b"
zone3        = "us-east-1c"
vpcCIDR      = "172.21.0.0/16"
pubSub1CIDR  = "172.21.1.0/24"
pubSub2CIDR  = "172.21.2.0/24"
pubSub3CIDR  = "172.21.3.0/24"
privSub1CIDR = "172.21.4.0/24"
privSub2CIDR = "172.21.5.0/24"
privSub3CIDR = "172.21.6.0/24"
```


## **Step 4: Provision the files**
* Run the following commands in your terminal:

```
terraform init
terraform fmt 
terraform validate
terraform plan
terraform apply -auto-approve
```
* Allow up to 3-4 minutes for the creation process to complete!!!

![apply](images/apply.png)

* You can now see your ECS Cluster and Service running

![ecs-svc](images/ecs-svc.png)

## **Step 5: Delete the files**

* Run the following command:

```
terraform destroy -auto-approve
```

* Then go and delete your S3 Bucket and ECR Repo