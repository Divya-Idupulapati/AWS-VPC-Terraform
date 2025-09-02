provider "aws"{
    region = "us-east-2"
    profile = "default" // aws account default credentials
}

terraform {
  required_version = ">= 0.14"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.7.2"
    }
  } 
}
