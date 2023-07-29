output "instance_ids" {
  value = { for key, instance in aws_instance.instance : key => instance.id }
}

output "public_ips" {
  value = { for key, instance in aws_instance.instance : key => instance.public_ip }
}

