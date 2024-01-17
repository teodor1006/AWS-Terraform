resource "aws_cognito_user_pool" "pool" {
  name              = "wild-rides-user-pool"
  mfa_configuration = "OFF"

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  alias_attributes = ["phone_number", "email", "preferred_username"]
  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_uppercase = true
    require_numbers   = true
    require_symbols   = true
  }
  auto_verified_attributes = ["email"]

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject        = "YOUR VERIFICATION CODE"
    email_message        = "This is your confirmation code: {####}"
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }
}

resource "aws_cognito_user_pool_client" "pool_client" {
  name         = "my-client"
  user_pool_id = aws_cognito_user_pool.pool.id
}

