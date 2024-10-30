provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region

  # run this when we store credentials in local machine and then terraform scripts, otherwise, the default profile will take it and have issue with kms permission
  #  profile = "gitops"
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.clusterName
}

##
