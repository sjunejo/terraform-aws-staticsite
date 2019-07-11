resource "aws_s3_bucket" "static-site" {
  bucket = local.bucketname
  acl    = var.bucket_acl
  force_destroy=var.force_destroy

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  tags = var.common_tags
}
