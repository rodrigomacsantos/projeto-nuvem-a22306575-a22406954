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

output "order_created_queue_url" {
  value = module.sqs.order_created_queue_url
}

output "order_created_queue_arn" {
  value = module.sqs.order_created_queue_arn
}

output "order_created_dlq_url" {
  value = module.sqs.order_created_dlq_url
}

output "order_created_dlq_arn" {
  value = module.sqs.order_created_dlq_arn
}