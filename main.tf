provider "aws" {
  region = "us-east-2"  # Update with your desired region
}

resource "aws_security_group" "ec2_sg" {
  name_prefix = "client-dev-ec2-sg"
  vpc_id      = var.vpc_id

  # ... (security group settings)
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "client-dev-ec2-profile"

  role = aws_iam_role.s3_access_role.name
}

resource "aws_iam_role" "s3_access_role" {
  name = "client-dev-ec2-s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  inline_policy {
    name   = "s3-access-policy"
    policy = file("s3_access_policy.json")
  }

  tags = {
    Name        = "client-dev-ec2-s3-role"
    Environment = var.environment
    Client      = var.client
  }
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t3.medium"  # Update with your desired instance type
  subnet_id     = var.subnet_id  

  key_name      = var.key_name

  user_data = base64encode(file("user_data.sh")) 

  tags = {
    Name        = "${var.client}-${substr(var.environment, 0, 1)}-aws-standalone"
    Environment = var.environment
    Client      = var.client
  }

  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
}

resource "aws_eip" "standalone_eip" {
  instance = aws_instance.web.id
}

