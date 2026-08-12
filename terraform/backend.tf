terraform {
  backend "s3" {
    bucket = "terraforrm-state-bucket-p1"
    key    = "./terraform.tfstate"
    region = "ap-south-1"
  }
}