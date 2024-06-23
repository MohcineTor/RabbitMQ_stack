resource "kubernetes_namespace" "ns" {
  metadata {
    name = var.namespace
  }
}

data "local_file" "pod_yaml" {
  filename = "${path.module}/debian_env.yaml"
}

resource "kubernetes_manifest" "debian_pod" {
  manifest = yamldecode(data.local_file.pod_yaml.content)
}