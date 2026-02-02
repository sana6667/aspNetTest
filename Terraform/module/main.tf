module "network" {
    source = "./eks/data-panel/networks"
}


module "bastion" {
    source = "./bastion"
    pub_sub_bastion = module.network.subnet_id_bastion
}

module "eks_cluster" {
    source = "./eks/control-panel"
    config_network_import = module.network.network_conf_export
}

module "workers_node" {
    source = "./eks/data-panel/workerNodes"
    conf_eks_import = module.eks_cluster.conf_eks_export
    conf_network_import = module.network.network_conf_export
}
