terraform {
  backend "s3" {
    bucket         = "macie-customization-audit"
    key            = "macie-customization-audit/terraform.tfstate"
    region         = "us-east-1"
  }
}