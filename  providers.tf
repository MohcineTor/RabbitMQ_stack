terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.29.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}


provider "helm" {
  kubernetes {
  config_path    = "~/.kube/config"
  config_context = "minikube"
  }
}

provider "kubectl" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}
