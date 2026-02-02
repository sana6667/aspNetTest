output "conf_ecr_export" {
    value = {
        url_ecr_repository = aws_ecr_repository.my_ecr.url_ecr_repository
    }
}