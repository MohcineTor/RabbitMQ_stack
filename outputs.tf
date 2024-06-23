output "namespace_name" {
  value = kubernetes_namespace.ns.metadata.0.name
}
