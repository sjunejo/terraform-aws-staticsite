module "static" {
  source              = "JamesWoolfenden/staticsite/aws"
  version             = "0.2.15"
  common_tags         = var.common_tags
  permitted_ip_ranges = concat(var.permitted_ip_ranges, var.slalom_ip)
  permitted_iam = [
    "arn:aws:iam::${data.aws_caller_identity.current.accoun_id}:role/*",
    "arn:aws:iam::${data.aws_caller_identity.current.accoun_id}:user/*"]
  s3_bucket_name = var.s3_bucket_name
  bucket_acl     = "Private"
}
