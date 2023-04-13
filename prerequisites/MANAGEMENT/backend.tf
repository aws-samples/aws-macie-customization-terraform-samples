terraform {
  backend "s3" {
    bucket         = "macie-customization-management"
    key            = "macie-customization-management/terraform.tfstate"
    region         = "us-east-1"
  }
}