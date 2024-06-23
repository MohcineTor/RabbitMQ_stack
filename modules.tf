module "create-rabbitmq" {
  source = "./create_rabbitmq"

  count                = var.create_rabbitmq ? 1 : 0
  namespace            = var.namespace 
  helm_chart_version   = var.helm_chart_version
}
