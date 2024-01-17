output "aws_dynamodb_table_arn" {
  value = aws_dynamodb_table.Wild-Rides-Details-db.arn
}

output "amplify_app_url" {
  value = aws_amplify_app.my_amplify_app.default_domain
}

output "userpool_id" {
  value = aws_cognito_user_pool.pool.id
}

output "client_id" {
  value = aws_cognito_user_pool_client.pool_client.id
}

output "lambda_output" {
  value = aws_lambda_invocation.invoke_test_event.result
}

output "api_gateway_invoke_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}