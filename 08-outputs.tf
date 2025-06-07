output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

# output "instance_ids" {
#   description = "IDs of all EC2 instances"
#   value       = aws_instance.ec2_instances[*].id
# }

# output "instance_public_ips" {
#   description = "Public IP addresses of all EC2 instances"
#   value       = aws_instance.ec2_instances[*].public_ip
# }

# output "instance_states" {
#   description = "Current states of all EC2 instances"
#   value       = aws_instance.ec2_instances[*].instance_state
# }

# output "stop_instance_id" {
#   description = "ID of the stopped instance"
#   value       = aws_instance.ec2_instances[0].id
# }

# output "start_instance_id" {
#   description = "ID of the started instance"
#   value       = aws_instance.ec2_instances[1].id
# }

# output "reboot_instance_id" {
#   description = "ID of the rebooted instance"
#   value       = aws_instance.ec2_instances[2].id
# }

# output "terminate_instance_id" {
#   description = "ID of the instance to terminate"
#   value       = aws_instance.ec2_instances[3].id
# }