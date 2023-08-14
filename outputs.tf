output "instance_id" {
  value = aws_instance.web.id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "eip_allocation_id" {
  value = aws_eip.standalone_eip.id
}

output "eip_public_ip" {
  value = aws_eip.standalone_eip.public_ip
}
