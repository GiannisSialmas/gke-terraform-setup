resource "google_container_node_pool" "default" {
  name       = "default-pool"
  cluster    = "${google_container_cluster.primary.name}"
  version    = "${data.google_container_engine_versions.versions.latest_node_version}"
  node_count = 3

  node_config {
    machine_type = "n1-standard-2"
  }
}

resource "google_container_node_pool" "postgres" {
  name       = "postgres-pool"
  cluster    = "${google_container_cluster.primary.name}"
  version    = "${data.google_container_engine_versions.versions.latest_node_version}"
  node_count = 1

  node_config {
    machine_type = "g1-small"
    taint {
      key    = "pool"
      value  = "postgres-pool"
      effect = "NO_SCHEDULE"
    }
  }
}

resource "google_container_node_pool" "app" {
  name       = "app-pool"
  cluster    = "${google_container_cluster.primary.name}"
  version    = "${data.google_container_engine_versions.versions.latest_node_version}"
  node_count = 2

  node_config {
    machine_type = "g1-small"
    taint {
      key    = "pool"
      value  = "app-pool"
      effect = "NO_SCHEDULE"
    }
  }
}
