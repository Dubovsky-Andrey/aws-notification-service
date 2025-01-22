output "instances_public_ips" {
  value = aws_instance.ec2_instance[*].public_ip  # List of public IPs of all EC2 instances
}