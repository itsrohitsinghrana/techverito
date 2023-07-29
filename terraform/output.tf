output "instance1_public_ip" {
  value = module.ec2_instances.public_ips["instance1"]
}

output "instance2_public_ip" {
  value = module.ec2_instances.public_ips["instance2"]
}
output "instance1_id" {
  value = module.ec2_instances.instance_ids["instance1"]
}

output "instance2_id" {
  value = module.ec2_instances.instance_ids["instance2"]
}
