resource "aws_s3_bucket" "my_s3" {
    bucket = var.conf_s3.backet_name
    tags = {
        name = "back-cdn"
    }
}