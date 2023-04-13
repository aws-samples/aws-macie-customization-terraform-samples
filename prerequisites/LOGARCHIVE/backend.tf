terraform {
  backend "s3" {
    bucket         = "macie-customization-logarchive"
    key            = "macie-customization-logarchive/terraform.tfstate"
    region         = "us-east-1"
  }
}