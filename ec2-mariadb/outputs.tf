output "instance_id" {
  value = aws_instance.rds.id
}

output "instance_public_ip" {
  value = aws_instance.rds.public_ip
}

output "eip_allocation_id" {
  value = aws_eip.rds_eip.id
}

output "eip_public_ip" {
  value = aws_eip.rds_eip.public_ip
}
