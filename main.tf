terraform {
    required_version = " 0.12.0"
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "tkaburagi"

        workspaces {
            name = "hashistack"
        }
    }
}

provider "aws" {
    alias  = "account-1"
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

provider "aws" {
    alias  = "account-2"
    region = var.region
    access_key = var.access_key_2
    secret_key = var.secret_key_2
}

module "aws-1" {
    source = "./modules/module-a"
    providers = {
        aws = aws.account-1
    }
}

module "aws-2" {
    source = "./modules/module-a"
    providers = {
        aws = aws.account-2
    }
}