locals {
  service_name_prefix = lower(replace("${var.subaccount_stage}-${var.project_name}", " ", "-"))
}