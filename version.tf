terraform {
  required_providers {
    exoscale = {
      source  = "exoscale/exoscale"
      version = "0.54.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
  backend "s3" {
    bucket                      = "terraform-state-bucket-game-app"
    region                      = "at-vie-2"
    key                         = "terraform.tfstate"
    endpoint                    = "https://sos-at-vie-2.exo.io"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
    use_path_style              = true
    insecure                    = true
  }
}

provider "helm" {
  kubernetes {
    config_path = "kubeconfig"
  }
}
provider "exoscale" {
  key    = var.exo_key
  secret = var.exo_secret
}
