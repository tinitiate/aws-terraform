provider "aws" {
  region = "us-east-2"  # Update with your desired region
  profile = "sbadmin"
}
locals {
  inbound_rules = jsondecode(file("inbound_rules.json"))
}
locals {
  outbound_rules = jsondecode(file("outbound_rules.json"))
}

resource "aws_security_group" "ec2_sg" {
  name_prefix = "client-dev-ec2-sg"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = local.inbound_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

   dynamic "egress" {
    for_each = local.outbound_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name        = "${var.client}-${substr(var.environment, 0, 1)}-web-sg"
    Environment = var.environment
    Client      = var.client
  }

}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "client-dev-web-profile"

  role = aws_iam_role.s3_access_role.name
}

resource "aws_iam_role" "s3_access_role" {
  name = "client-dev-web-s3-role"

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
  instance_type = var.instance_type
  subnet_id     = var.subnet_id  
  key_name      = var.key_name
  user_data = base64encode(file("user_data.sh")) 
  vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

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

