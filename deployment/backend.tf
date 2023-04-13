terraform {
  backend "s3" {
    bucket         = "macie-customization-bucket"
    key            = "macie-customization/terraform.tfstate"
    region         = "us-east-1"
  }
}