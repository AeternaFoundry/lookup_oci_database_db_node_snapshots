data "oci_database_db_node_snapshots" "database_db_node_snapshots_lookup" {
  for_each = var.database_db_node_snapshots_lookup

  compartment_id   = each.value.compartment_id
  cluster_id       = each.value.cluster_id
  name             = each.value.name
  source_dbnode_id = each.value.source_dbnode_id
  state            = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

