resource "aws_iam_user" "terraform-user" {
  name = "terraform_user"
}

resource "aws_iam_policy" "terraform_policy" {
  name = "terraform-resume-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*",
          "cloudfront:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach" {
  user   = aws_iam_user.terraform_user.name
  policy = aws_iam_policy.terraform_policy.arn
}