locals {
  subaccount_name      = "${var.subaccount_stage} ${var.project_name}"
  subaccount_subdomain = join("-", [lower(replace("${var.subaccount_stage}-${var.project_name}", " ", "-")), random_uuid.uuid.result])
  beta_enabled         = var.subaccount_stage == "PRD" ? false : true
  service_name_prefix  = lower(replace("${var.subaccount_stage}-${var.project_name}", " ", "-"))
  cf-name              = "${local.subaccount_subdomain}-cf"
}