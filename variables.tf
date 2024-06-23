variable "create_rabbitmq" {
  description = "Whether to create RabbitMQ resources"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "the namespace"
  type        = string
  default     = "dev"
}

variable "helm_chart_version" {
  type    = string
  default = "13.0.3"
}
