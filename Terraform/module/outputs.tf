output "eks_cluster_name" {
  value = module.eks_cluster.conf_eks_export.cluster_eks_name
}

output "rds_endpoint" {
  value = module.rds.rds_export.endpoint
}

output "rds_port" {
  value = module.rds.rds_export.port
}

output "rds_db_name" {
  value = module.rds.rds_export.db_name
}

output "rds_username" {
  value = module.rds.rds_export.username
}

# Приватные подсети (EKS worker nodes)
output "private_subnets" {
  value = module.network.network_conf_export.sub_priv_value
}

# Роль нод (для aws-auth)
output "node_role_arn" {
  value = module.workers_node.nodes_role_arn
}

output "eks_oidc" {
  value = module.eks_cluster.oidc_eks
}
