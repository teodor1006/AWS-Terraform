resource "aws_codecommit_repository" "wild_rides" {
  repository_name = "wild-rides-repo"
  description     = "CodeCommit Repository for the Web App"
}

output "repository_url" {
  value = aws_codecommit_repository.wild_rides.clone_url_http
}

