output "dist_files" {
  value = fileset(local.dist_dir, "**/*")
}

output "s3_website_endpoint" {
  value = "http://${aws_s3_bucket_website_configuration.website_bucket.website_endpoint}"
}

output "cloudfront_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_url" {
  value = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
}

output "website_url" {
  value = "https://${var.domain_name}"
}