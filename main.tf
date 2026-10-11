resource "google_healthcare_pipeline_job" "healthcare_pipeline_jobs" {
  for_each = var.healthcare_pipeline_jobs

  dataset         = each.value.dataset
  location        = each.value.location
  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  disable_lineage = each.value.disable_lineage
  labels          = each.value.labels

  dynamic "backfill_pipeline_job" {
    for_each = each.value.backfill_pipeline_job != null ? [each.value.backfill_pipeline_job] : []
    content {
      mapping_pipeline_job = backfill_pipeline_job.value.mapping_pipeline_job
    }
  }

  dynamic "mapping_pipeline_job" {
    for_each = each.value.mapping_pipeline_job != null ? [each.value.mapping_pipeline_job] : []
    content {
      fhir_store_destination = mapping_pipeline_job.value.fhir_store_destination
      dynamic "fhir_streaming_source" {
        for_each = mapping_pipeline_job.value.fhir_streaming_source != null ? [mapping_pipeline_job.value.fhir_streaming_source] : []
        content {
          description = fhir_streaming_source.value.description
          fhir_store  = fhir_streaming_source.value.fhir_store
        }
      }
      mapping_config {
        description = mapping_pipeline_job.value.mapping_config.description
        dynamic "whistle_config_source" {
          for_each = mapping_pipeline_job.value.mapping_config.whistle_config_source != null ? [mapping_pipeline_job.value.mapping_config.whistle_config_source] : []
          content {
            import_uri_prefix = whistle_config_source.value.import_uri_prefix
            uri               = whistle_config_source.value.uri
          }
        }
      }
      reconciliation_destination = mapping_pipeline_job.value.reconciliation_destination
    }
  }

  dynamic "reconciliation_pipeline_job" {
    for_each = each.value.reconciliation_pipeline_job != null ? [each.value.reconciliation_pipeline_job] : []
    content {
      fhir_store_destination = reconciliation_pipeline_job.value.fhir_store_destination
      matching_uri_prefix    = reconciliation_pipeline_job.value.matching_uri_prefix
      merge_config {
        description = reconciliation_pipeline_job.value.merge_config.description
        whistle_config_source {
          import_uri_prefix = reconciliation_pipeline_job.value.merge_config.whistle_config_source.import_uri_prefix
          uri               = reconciliation_pipeline_job.value.merge_config.whistle_config_source.uri
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

