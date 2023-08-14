# Terraform Configuration Explanation

This `README.md` file provides an explanation for the Terraform configuration provided in the associated Terraform code. The code describes the provisioning of an EC2 instance, an associated security group, IAM roles, and an Elastic IP address.

## Configuration Explanation

### Provider

The AWS provider is configured with the desired region where resources will be created.

```hcl
provider "aws" {
  region = "us-east-2" }
