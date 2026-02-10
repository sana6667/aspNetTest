output "rds_export" {
  description = "Conect"
  value = {
    endpoint = aws_db_instance.rds.address
    port     = aws_db_instance.rds.port
    db_name  = aws_db_instance.rds.db_name
    username = aws_db_instance.rds.username
  }
}