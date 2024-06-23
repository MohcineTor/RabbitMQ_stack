variable "helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "helm_chart" {
  type    = string
  default = "rabbitmq"
}

variable "helm_chart_version" {
  type    = string
}

variable "helm_release_name" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmq_admin_username" {
  type    = string
  default = "admin"
}

variable "requests_memory" {
  type = string
  default = "1024Mi"
}
variable "requests_cpu" {
  type = string
  default = "375m"
}

variable "limits_memory" {
  type = string
  default = "2048Mi"
}
variable "limits_cpu" {
  type = string
  default = "800m"
}

variable "namespace" {
  description = "the namespace"
  type        = string
}
