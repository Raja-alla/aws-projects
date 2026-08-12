output "s3_bucket_name" {
  description = "bucket name"
  value = module.website_s3.bucket_id
}

output "s3_bucket_arn" {
  description = "ARN of the website S3 bucket"
  value       = module.website_s3.bucket_arn
}

output "cloudfront_oac_id" {
  description = "ID of the CloudFront Origin Access Control"
  value       = aws_cloudfront_origin_access_control.website.id
}

output "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.website.arn
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.website.domain_name
}
output "aws_region" {
  description = "AWS region where Terraform is operating"
  value       = data.aws_region.current.region
}

