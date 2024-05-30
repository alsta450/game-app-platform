# Gamechart Helm Release
resource "helm_release" "game_chart" {
  name             = "gamechart"
  repository       = "https://alsta450.github.io/game-app-helm/charts"
  chart            = "gamechart"
  version          = "0.1.0"
  timeout          = 1200
  create_namespace = true
  namespace        = "keycloak"
  lint             = true
  wait             = true

  values = [templatefile("values.yaml", {
  })]

  depends_on = [
    helm_release.cert_manager
  ]
}
