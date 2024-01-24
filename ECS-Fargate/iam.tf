resource "aws_iam_role" "iam-role" {
  name               = "IAM-Role-ECS-Execution"
  assume_role_policy = file("${path.module}/iam-role.json")
}

resource "aws_iam_role_policy" "iam-policy" {
  name   = "AWS-ECS-Execution-Role"
  role   = aws_iam_role.iam-role.id
  policy = file("${path.module}/iam-policy.json")
}