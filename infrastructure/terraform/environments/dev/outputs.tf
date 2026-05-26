output "instance_id" {
  value = module.compute.instance_id
}

output "instance_public_ip" {
  value = module.compute.instance_public_ip
}

output "instance_public_dns" {
  value = module.compute.instance_public_dns
}

output "db_endpoint" {
  value = module.database.db_endpoint
}