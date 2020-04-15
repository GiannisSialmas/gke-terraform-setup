output "deployed_master_version" {
 value = "${google_container_cluster.primary.master_version}"
}

output "node_version" {
 value = "${data.google_container_engine_versions.versions.latest_node_version}"
}