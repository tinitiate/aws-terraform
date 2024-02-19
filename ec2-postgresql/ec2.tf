resource "aws_instance" "postgres_instance" {
  ami           = "ami-123456" # replace with the latest Amazon Linux AMI in your region
  instance_type = "t2.micro"
  key_name      = "your-key-pair" # replace with your key pair name
  subnet_id     = aws_subnet.main.id
  security_groups = [aws_security_group.allow_postgres.name]

  iam_instance_profile {
    name = aws_iam_role.ec2_role.name
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install postgresql postgresql-contrib -y
              sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'TTraining!2345';"
              EOF

  tags = {
    Name = "PostgreSQLInstance"
  }
}
