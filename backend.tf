terraform {
  backend "s3" {
    bucket = "terraform-state-bob347dylan"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}