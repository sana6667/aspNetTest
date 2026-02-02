resource "aws_iam_role" "role_eks" {
    name = var.config_eks["iam_role_name"]
    assume_role_policy = <<POLICY
    {
    "Version": "2012-10-17",
    "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                },
                "Action": "sts.AssumeRole"
            }
        ]
    }
    POLICY
}