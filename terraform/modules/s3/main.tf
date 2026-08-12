resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
   lifecycle {
    prevent_destroy = true
  }
}