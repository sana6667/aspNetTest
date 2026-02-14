resource "aws_iam_role" "alb_cont_role" {
    name = "alb-controller-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = {
                    Federated = aws_iam_openid_connect_provider.git_hub.arn
                }
                Action = "sts:AssumeRoleWithWebIdentity"
                Condition = {
                    StringEquals = {
                        "${replace(aws_iam_openid_connect_provider.git_hub.url, "https://", "")}:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
                    }
                }
            }
        ]
    })
}

resource "aws_iam_policy" "lb_controller_policy" {
    name = "alb-controller-policy"
    policy = file("${path.module}/iam_policy.json")
}

resource "aws_iam_role_policy_attachment" "lb_cont_attach" {
    role = aws_iam_role.alb_cont_role.name
    policy_arn = aws_iam_policy.lb_controller_policy.arn
}