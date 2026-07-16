output "vpc_id" {
  description = "ID of the capstone VPC"
  value       = aws_vpc.capstone.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "linux_instance_id" {
  description = "EC2 instance ID of the Linux automation target"
  value       = aws_instance.linux.id
}

output "linux_public_ip" {
  description = "Public IP address of the Linux automation target"
  value       = aws_instance.linux.public_ip
}

output "linux_public_dns" {
  description = "Public DNS name of the Linux automation target"
  value       = aws_instance.linux.public_dns
}

output "linux_ssh_command" {
  description = "SSH command for the capstone Linux host"
  value       = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.linux.public_ip}"
}
