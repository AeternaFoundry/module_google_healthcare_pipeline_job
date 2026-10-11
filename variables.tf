variable "healthcare_pipeline_jobs" {
  description = <<EOT
Map of healthcare_pipeline_jobs, attributes below
Required:
    - dataset
    - location
    - name
Optional:
    - deletion_policy
    - disable_lineage
    - labels
    - backfill_pipeline_job (block):
        - mapping_pipeline_job (optional)
    - mapping_pipeline_job (block):
        - fhir_store_destination (optional)
        - fhir_streaming_source (optional, block):
            - description (optional)
            - fhir_store (required)
        - mapping_config (required, block):
            - description (optional)
            - whistle_config_source (optional, block):
                - import_uri_prefix (required)
                - uri (required)
        - reconciliation_destination (optional)
    - reconciliation_pipeline_job (block):
        - fhir_store_destination (optional)
        - matching_uri_prefix (required)
        - merge_config (required, block):
            - description (optional)
            - whistle_config_source (required, block):
                - import_uri_prefix (required)
                - uri (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    dataset         = string
    location        = string
    name            = string
    deletion_policy = optional(string)
    disable_lineage = optional(bool)
    labels          = optional(map(string))
    backfill_pipeline_job = optional(object({
      mapping_pipeline_job = optional(string)
    }))
    mapping_pipeline_job = optional(object({
      fhir_store_destination = optional(string)
      fhir_streaming_source = optional(object({
        description = optional(string)
        fhir_store  = string
      }))
      mapping_config = object({
        description = optional(string)
        whistle_config_source = optional(object({
          import_uri_prefix = string
          uri               = string
        }))
      })
      reconciliation_destination = optional(bool)
    }))
    reconciliation_pipeline_job = optional(object({
      fhir_store_destination = optional(string)
      matching_uri_prefix    = string
      merge_config = object({
        description = optional(string)
        whistle_config_source = object({
          import_uri_prefix = string
          uri               = string
        })
      })
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

