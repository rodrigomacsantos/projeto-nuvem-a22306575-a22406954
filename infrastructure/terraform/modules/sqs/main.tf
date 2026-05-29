resource "aws_sqs_queue" "order_created_dlq" {
  name = "${var.name_prefix}-order-created-dlq"

  message_retention_seconds = 1209600

  tags = {
    Name = "${var.name_prefix}-order-created-dlq"
  }
}

resource "aws_sqs_queue" "order_created" {
  name = "${var.name_prefix}-order-created-queue"

  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.order_created_dlq.arn
    maxReceiveCount     = 3
  })

  tags = {
    Name = "${var.name_prefix}-order-created-queue"
  }
}