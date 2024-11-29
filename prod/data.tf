locals {
  account-id = data.aws_caller_identity.current.account_id
  iam_role   = var.backend_iam_role
}

data "aws_iam_policy_document" "ecr_repo_policy" {
  statement {
    sid    = "All Accounts in the Org can pull"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:ListImages"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalAccount"
      values   = [local.account-id]
    }
  }
  statement {
    sid    = "Allow push only from github actions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account-id}:role/${local.iam_role}"]
    }
    actions = ["ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
    "ecr:UploadLayerPart"]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalAccount"
      values   = [local.account-id]
    }
  }
}

