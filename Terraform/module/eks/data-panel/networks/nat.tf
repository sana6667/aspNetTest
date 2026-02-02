resource "aws_eip" "my_eip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "my_nat" {
    subnet_id = aws_subnet.pub_sub[1].id
    allocation_id = aws_eip.my_eip.id
    tags = {
        name = var.vpc_config["nat_name"]
    }
}