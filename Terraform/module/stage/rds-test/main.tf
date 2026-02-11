terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.60"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

locals {
    admin_pass = "7bKtHqfhlzNLM304WeK1"
}

data "aws_vpc" "def_vpc" {
    default = true
}

resource "aws_security_group" "mysql_sg" {
    name = "mysql-sg-test"
    vpc_id = data.aws_vpc.def_vpc.id
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_db_instance" "my_rds_mysql" {
    allocated_storage = 20
    db_name = "aspnetdb"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    max_allocated_storage = 20
    vpc_security_group_ids = [ aws_security_group.mysql_sg.id ]
    username = "sana"
    password = local.admin_pass
    storage_type = "gp3"
    multi_az = false
    publicly_accessible = true
    skip_final_snapshot = true
    deletion_protection = false
}

output "rds_enpoint" {
    value = aws_db_instance.my_rds_mysql.address
}

