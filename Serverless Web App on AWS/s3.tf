resource "aws_s3_bucket" "s3-bucket" {
    bucket = "wild-rides-serverless" 
}

resource "aws_s3_bucket_public_access_block" "s3-bucket-block" {
  bucket = aws_s3_bucket.s3-bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

data "archive_file" "source" {
  type = "zip"
  source_dir = "./wild-rides-repo/"
  output_path = "./wild-rides-repo/index.zip"
}

# Upload the zip file to S3 Bucket
resource "aws_s3_object" "lambda-function-code" {
  bucket = aws_s3_bucket.s3-bucket.bucket
  source = data.archive_file.source.output_path
  key = "index.zip"
  acl = "private"

  depends_on = [ aws_s3_bucket.s3-bucket ]
}