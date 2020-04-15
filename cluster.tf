resource "google_container_cluster" "primary" {

  name               = "${var.clustername}"
  min_master_version = "${data.google_container_engine_versions.versions.latest_master_version}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  # logging_service = "none"

}

