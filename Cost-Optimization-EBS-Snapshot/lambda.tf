resource "aws_lambda_function" "cost-reporting-lambda" {
  filename         = "lambda_function.zip"
  function_name    = var.lambda-function-name
  role             = aws_iam_role.ebs-iam-role.arn
  handler          = "lambda_function.lambda_handler"
  timeout          = 10
  memory_size      = 128
  runtime          = "python3.10"
  source_code_hash = filebase64sha256("lambda_function.zip")
}