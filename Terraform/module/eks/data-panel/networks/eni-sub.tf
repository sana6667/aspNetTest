resource "aws_subnet" "sub_eni" {
    count = length(var.vpc_config.eni_sub)
    vpc_id = aws_vpc.vpc_data_panel.id
    cidr_block = var.vpc_config.eni_sub[count.index]
    availability_zone = var.vpc_config["asz_value"][count.index]
    tags = {
        name = "sub-eni-${count.index}"
    }
}