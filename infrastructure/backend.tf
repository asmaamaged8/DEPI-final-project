terraform {
  backend "s3" {
    bucket         = "asmaa0"
    key            = "depi.tfstate"
    region         = "us-east-1"
    profile        = "terraform_user"
  }
}