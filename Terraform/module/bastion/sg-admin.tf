resource "aws_security_group" "bastion_sg" {
    name = "Bastion-sg"
    description = "Sg admin host"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["188.163.44.234/32"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
       name = var.conf_bastion_host.name_sg_bastion 
    }
}