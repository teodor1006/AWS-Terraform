resource "aws_iam_role" "ebs-iam-role" {
  name               = "iam-role-${var.lambda-function-name}"
  assume_role_policy = file("${path.module}/iam-role.json")
}

resource "aws_iam_role_policy" "ebs-iam-policy" {
  name   = "iam-policy-${var.lambda-function-name}"
  role   = aws_iam_role.ebs-iam-role.id
  policy = file("${path.module}/iam-policy.json")
}