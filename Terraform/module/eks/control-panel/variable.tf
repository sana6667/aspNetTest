variable "config_eks" {
    type = object({
      cluster_name = string
      cluster_version = string
      iam_role_name = string
    })
    default = {
        cluster_name = "priv-cluster-eks"
        cluster_version = "1.31"
        iam_role_name = "eks-assume-role"
    }
}

variable "config_network_import" {
    type = object({
      sub_eni_value = list(string)
    })
}