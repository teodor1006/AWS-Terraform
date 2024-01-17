resource "aws_dynamodb_table" "Wild-Rides-Details-db" {
  name           = "Wild-Rides-Table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "RideId"

  attribute {
    name = "RideId"
    type = "S"
  }

  tags = {
    Name = "ProductionDB"
  }
}
