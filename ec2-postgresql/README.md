# Terraform EC2 Posrgresql DB

## Objectives
Terraform scripts and explain how to run them: To do the following
1. create EC2 unix instance with user:groups [admin, dbuser]
2. create user where (usergroup,user,password) = (admin,root,TTraining!2345)
3. create user where (usergroup,user,password) = (dbuser,pguser,TTraining!2345)
4. Install latest stable postgresql db with root user: postgres and password: TTraining!2345
5. Make sure to create VPC and IP-address stuff as needed
6. Create Iam roles as needed to access s3-bucket: t-p-data, 
   Make sure this EC2-Postgresql can be accessed by DMS service, Glue service and Lambda/Step functions
7. Open the ports so I can access the postgresql from my personal laptop using the aws profile "venkata"

## Prerequisites
* Install Terraform: Make sure you have Terraform installed on your machine.
* AWS CLI: Install and configure the AWS CLI with necessary permissions.
* AWS Account: Have access to an AWS account with the necessary permissions to create the resources.

## Steps to run terraform scripts
* Initialize Terraform: `terraform init`
* Plan the Deployment: `terraform plan`
* Apply the Configuration: `terraform apply`


## Additional Setup (Post-creation)
Creating Users in EC2 Instance: You'll need to manually create users admin and dbuser on the EC2 instance as Terraform does not directly manage OS-level configurations. You can use an EC2 user data script or a configuration management tool like Ansible for this.
Configuring PostgreSQL: You may need to adjust PostgreSQL configurations for network access and authentication as required.

## Accessing PostgreSQL
Configure your PostgreSQL client with the EC2 instance's public IP, username postgres, and the password you've set.
Ensure your local IP is allowed in the EC2 instance's security group.
This setup provides a basic implementation. Depending on your exact requirements and security policies, you might need to adjust the configurations.
