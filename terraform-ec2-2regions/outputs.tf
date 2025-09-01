output "use1_public_ip" {
  value = aws_instance.use1_instance.public_ip
}

output "aps1_public_ip" {
  value = aws_instance.aps1_instance.public_ip
}
