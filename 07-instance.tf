resource "aws_instance" "ec2_instance" {
  count = var.instance_count
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  # key_name = var.key_name.id

  tags = {
    Name = var.instance_names[count.index]
  }
}
#   lifecycle {
#     prevent_destroy = count.index == 3 ? false : true # Only allow termination for the Terminate-Instance
#   }
# }

# # For instances where prevent_destroy should be true
# resource "aws_instance" "ec2_instance_protected" {
#   count = 3 # adjust as needed
#   ami = data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type
#   subnet_id = aws_subnet.public.id
#   vpc_security_group_ids = [aws_security_group.ec2_sg.id]
#   key_name = var.key_name.id

#   tags = {
#     Name = var.instance_names[count.index]
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# # For the instance where prevent_destroy should be false (allow destroy)
# resource "aws_instance" "ec2_instance_terminatable" {
#   ami = data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type
#   subnet_id = aws_subnet.public.id
#   vpc_security_group_ids = [aws_security_group.ec2_sg.id]
#   key_name = var.key_name.id

#   tags = {
#     Name = var.instance_names[3]
#   }

#   lifecycle {
#     prevent_destroy = false
#   }
# }

# # Stop the first instance
# resource "aws_ec2_instance_state" "stop_instance" {
#   instance_id = aws_instance.ec2_instances[0].id
#   state       = "stopped"
# }

# # Ensure the second instance is running (start if stopped)
# resource "aws_ec2_instance_state" "start_instance" {
#   instance_id = aws_instance.ec2_instances[1].id
#   state       = "running"
# }

# # Reboot the third instance (Terraform doesn't have a direct reboot resource, 
# # but we can use a null_resource with local-exec to trigger a reboot)
# resource "null_resource" "reboot_instance" {
#   triggers = {
#     instance_id = aws_instance.ec2_instances[2].id
#   }

#   provisioner "local-exec" {
#     command = "aws ec2 reboot-instances --instance-ids ${aws_instance.ec2_instances[2].id} --region ${var.aws_region}"
#   }
# }