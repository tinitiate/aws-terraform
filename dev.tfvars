vpc_id        = "vpc-08f1ebe836f2cdacf"
subnet_id     = "subnet-0ca06d359b70d2e3b"
key_name      = "sb-training-ec2-001"
ami_id        = "ami-098dd3a86ea110896"
instance_type = "t3.small"
volume_size   = 60
client      = "tinitiate"
environment = "dev"
resources_count = 1
user_data_file="install_mariadb.sh"
inbound_rules_file="mysql_inbound_rules.json"
outbound_rules_file="outbound_rules.json"
s3_access_policy_file="s3_access_policy.json"