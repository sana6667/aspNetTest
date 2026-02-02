variable "conf_cloudFron" {
    type = object({
      provider_name = string
      dns_name = string
    })

    default = {
        sub_dns = "app.soc-net.lat"
        dns_name = "soc-net.lat"
    }
}