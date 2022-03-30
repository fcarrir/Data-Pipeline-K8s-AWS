provider "aws" {
  region = var.aws_region
}

#Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-fcarrir-930800861540"
    key    = "state/igti/edc/eks/terraform.tfstate"
    region = "us-east-2"
  }
}