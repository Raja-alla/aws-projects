
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.state_bucket_name

  lifecycle {
    prevent_destroy = true
  }
}

module "website_s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name


}

moved {
  from = aws_s3_bucket.website
  to   = module.webiste_s3.aws_s3_bucket.website
}