locals {
  values_rabbitmq = {
    "ADMIN_USERNAME"       = var.rabbitmq_admin_username
    "ADMIN_PASSWORD"       = random_password.rabbitmq_admin_password.result
    "INSTANCE_NAME"        = local.instance_name
    "REQUESTS_MEMORY"      = var.requests_memory
    "REQUESTS_CPU"         = var.requests_cpu
    "LIMITS_MEMORY"        = var.limits_memory
    "LIMITS_CPU"           = var.limits_cpu
  }
  instance_name = "${var.helm_release_name}-${var.namespace}"
}

resource "helm_release" "rabbitmq" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_rabbitmq)
  ]
}

resource "random_password" "rabbitmq_admin_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "rabbitmq-secret" {
  metadata {
    name      = "${local.instance_name}-secret"
    namespace = var.namespace
    labels = {
      "app" = "rabbitmq"
    }
  }

  data = {
    admin-username    = var.rabbitmq_admin_username
    admin-password    = random_password.rabbitmq_admin_password.result
  }

  type = "Opaque"
}