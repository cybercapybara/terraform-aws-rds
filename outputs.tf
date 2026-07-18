output "id" {
  description = "Identifier of the DB instance."
  value       = aws_db_instance.this.id
}

output "arn" {
  description = "ARN of the DB instance."
  value       = aws_db_instance.this.arn
}

output "endpoint" {
  description = "Connection endpoint of the DB instance in address:port form."
  value       = aws_db_instance.this.endpoint
}

output "address" {
  description = "Hostname of the DB instance."
  value       = aws_db_instance.this.address
}

output "port" {
  description = "Port the DB instance listens on."
  value       = aws_db_instance.this.port
}
