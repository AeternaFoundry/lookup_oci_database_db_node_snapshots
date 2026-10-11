variable "database_db_node_snapshots_lookup" {
  description = <<EOT
Map of database_db_node_snapshots_lookup, attributes below
Required:
    - compartment_id
Optional:
    - cluster_id
    - name
    - source_dbnode_id
    - state
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id   = string
    cluster_id       = optional(string)
    name             = optional(string)
    source_dbnode_id = optional(string)
    state            = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

