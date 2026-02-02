output "subnet_id_bastion" {
    value = aws_subnet.pub_sub[0].id
}

output "network_conf_export" {
    value = {
        sub_eni_value = aws_subnet.sub_eni[*].id 
        sub_priv_value =aws_subnet.priv_sub[*].id
    }
}

