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

data "aws_route53_zone" "main_zone" {
    name = "soc-net.lat"
    private_zone = false
}


data "aws_lb" "backend_lb" {
    tags = {
        "elbv2.k8s.aws/cluster" = "priv-cluster-eks"
        "kubernetes.io/ingress-name" = "backend"
        "kubernetes.io/service-name" = "default/backend-service"

    }
} 

resource "aws_route53_record" "backend_cname" {
    zone_id = data.aws_route53_zone.main_zone.id
    name = var.conf_cloudFron.sub_dns_alb
    type = "A"
    alias {
        name = data.aws_lb.backend_lb.dns_name
        zone_id = data.aws_lb.backend_lb.zone_id
        evaluate_target_health = false
    }
    
}

