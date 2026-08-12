resource "aws_s3_bucket_public_access_block" "website" {
  bucket = module.website_s3.bucket_id


  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}
#state file bucket
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

locals {
  website_files = {
    "index.html" = {
      source       = "../index.html"
      content_type = "text/html"
    }
    "style.css" = {
      source       = "../style.css"
      content_type = "text/css"
    }
    "js" = {
      source       = "../script.js"
      content_type = "application/js"
    }
  }
}

resource "aws_s3_object" "website_files" {
  for_each = local.website_files

  bucket       = module.website_s3.bucket_id
  key          = each.key
  source       = each.value.source
  content_type = each.value.content_type


}

data "aws_iam_policy_document" "cloudfront_s3" {
  statement {
    sid    = "AllowCloudFrontServicePrincipalReadOnly"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${module.website_s3.bucket_arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values = [
        aws_cloudfront_distribution.website.arn
      ]
    }
  }
}


resource "aws_s3_bucket_policy" "cloudfront" {
  bucket = module.website_s3.bucket_id

  policy = data.aws_iam_policy_document.cloudfront_s3.json

}

resource "aws_s3_bucket_versioning" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}