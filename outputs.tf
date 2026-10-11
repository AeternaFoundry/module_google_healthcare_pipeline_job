output "healthcare_pipeline_jobs_id" {
  description = "Map of id values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no id are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "healthcare_pipeline_jobs_backfill_pipeline_job" {
  description = "Map of backfill_pipeline_job values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no backfill_pipeline_job are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => one(v.backfill_pipeline_job) if v.backfill_pipeline_job != null && length(v.backfill_pipeline_job) > 0 }
}
output "healthcare_pipeline_jobs_dataset" {
  description = "Map of dataset values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no dataset are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.dataset if v.dataset != null && length(v.dataset) > 0 }
}
output "healthcare_pipeline_jobs_deletion_policy" {
  description = "Map of deletion_policy values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no deletion_policy are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "healthcare_pipeline_jobs_disable_lineage" {
  description = "Map of disable_lineage values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no disable_lineage are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.disable_lineage if v.disable_lineage != null }
}
output "healthcare_pipeline_jobs_effective_labels" {
  description = "Map of effective_labels values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no effective_labels are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "healthcare_pipeline_jobs_labels" {
  description = "Map of labels values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no labels are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "healthcare_pipeline_jobs_location" {
  description = "Map of location values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no location are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.location if v.location != null && length(v.location) > 0 }
}
output "healthcare_pipeline_jobs_mapping_pipeline_job" {
  description = "Map of mapping_pipeline_job values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no mapping_pipeline_job are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => one(v.mapping_pipeline_job) if v.mapping_pipeline_job != null && length(v.mapping_pipeline_job) > 0 }
}
output "healthcare_pipeline_jobs_name" {
  description = "Map of name values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no name are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "healthcare_pipeline_jobs_reconciliation_pipeline_job" {
  description = "Map of reconciliation_pipeline_job values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no reconciliation_pipeline_job are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => one(v.reconciliation_pipeline_job) if v.reconciliation_pipeline_job != null && length(v.reconciliation_pipeline_job) > 0 }
}
output "healthcare_pipeline_jobs_self_link" {
  description = "Map of self_link values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no self_link are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.self_link if v.self_link != null && length(v.self_link) > 0 }
}
output "healthcare_pipeline_jobs_terraform_labels" {
  description = "Map of terraform_labels values across all healthcare_pipeline_jobs, keyed the same as var.healthcare_pipeline_jobs except keys with no terraform_labels are omitted"
  value       = { for k, v in google_healthcare_pipeline_job.healthcare_pipeline_jobs : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}

