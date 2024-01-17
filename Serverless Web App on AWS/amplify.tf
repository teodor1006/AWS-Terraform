resource "aws_amplify_app" "my_amplify_app" {
  name                 = "Wild-Rides-Amplify-App"
  repository           = var.codecommit_repo_url
  oauth_token          = var.codecommit_git_credential
  iam_service_role_arn = aws_iam_role.iam_role_amplify.arn

  build_spec = <<BUILD_SPEC
  version: 1
  frontend:
    phases:
      build:
        commands: []
    artifacts:
      baseDirectory: /
      files:
        - '**/*'
    cache:
      paths: []
  BUILD_SPEC            
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.my_amplify_app.id
  branch_name = var.app_branch
}


