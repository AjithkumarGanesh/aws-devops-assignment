# output

output "aws_region" {
  description = "The AWS region used for deployment"
  value       = var.aws_region
}

output "ec2_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.ec2.public_ip
}
