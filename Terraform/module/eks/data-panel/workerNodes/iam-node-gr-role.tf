resource "aws_iam_role" "nodes_gr" {
    name = var.config_workers.iam_role_name
    assume_role_policy = jsonencode({
        Statement = [{
            Action = "sts.AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "eks.amazonaws.com"
            }

        }]
        Version = "2012-10-17"
    })
}

resource "aws_iam_role_policy_attachment" "amazon_eks_worker_node_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.nodes_gr.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.nodes_gr.name
}

resource "aws_iam_role_policy_attachment" "mazon_ec2_container_registry_read_only" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.nodes_gr.name
}

resource "aws_iam_role_policy_attachment" "amazon_ssm_managed_instance_core" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    role = aws_iam_role.nodes_gr.name
}
