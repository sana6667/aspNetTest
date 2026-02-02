variable "vpc_config" {
    type = object({
      name = string
      cidr = string
      private_sub = list(string)
      pub_sub = list(string)
      default_route = string
      asz_value = list(string)
      nat_name = string
      eni_sub = list(string)
    })
    default = {
        name = "my-vpc-data-panel"
        cidr = "10.10.0.0/16"
        private_sub = [ "10.10.0.0/24", "10.10.1.0/24" ]
        pub_sub = [ "10.10.2.0/24", "10.10.3.0/24" ]
        asz_value = [ "us-east-1a", "us-east-1b" ]
        nat_name = "my-nat"
        default_route = "0.0.0.0/0"
        eni_sub = [ "10.10.4.0/28", "10.10.4.16/28" ]
    }
}


