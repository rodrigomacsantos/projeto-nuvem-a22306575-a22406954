output "order_created_queue_url" {
  value = aws_sqs_queue.order_created.url
}

output "order_created_queue_arn" {
  value = aws_sqs_queue.order_created.arn
}

output "order_created_dlq_url" {
  value = aws_sqs_queue.order_created_dlq.url
}

output "order_created_dlq_arn" {
  value = aws_sqs_queue.order_created_dlq.arn
}