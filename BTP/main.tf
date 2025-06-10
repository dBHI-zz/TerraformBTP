resource "random_uuid" "uuid" {}
data "btp_globalaccount" "this" {}

locals {
  subaccount_name      = "${var.subaccount_stage} ${var.project_name}"
  subaccount_subdomain = join("-", [lower(replace("${var.subaccount_stage}-${var.project_name}", " ", "-")), random_uuid.uuid.result])
  beta_enabled         = var.subaccount_stage == "PRD" ? false : true
  service_name_prefix  = lower(replace("${var.subaccount_stage}-${var.project_name}", " ", "-"))
  cf-name              = "${local.subaccount_subdomain}-cf"
}


resource "btp_subaccount" "project_subaccount" {
  name         = local.subaccount_name
  subdomain    = local.subaccount_subdomain
  region       = var.subaccount_region
  beta_enabled = local.beta_enabled
  labels = {
    "stage"      = [var.subaccount_stage]
    "costcenter" = [var.project_costcenter]
  }
}

module "standard_services" {
  source           = "./modules/srvc-baseline"
  subaccount_stage = var.subaccount_stage
  project_name     = var.project_name
  subaccount_id    = btp_subaccount.project_subaccount.id

}

data "btp_subaccount_environments" "all_environments" {
  subaccount_id = btp_subaccount.project_subaccount.id
}

resource "terraform_data" "cf_landscape_label" {
  input = length(var.cf_landscape_label) > 0 ? var.cf_landscape_label : [for env in data.btp_subaccount_environments.all_environments.values : env if env.environment_type == "cloudfoundry" && env.service_name == "cloudfoundry"][0].landscape_label
}

resource "btp_subaccount_environment_instance" "cloudfoundry" {
  subaccount_id    = btp_subaccount.project_subaccount.id
  name             = local.cf-name
  environment_type = "cloudfoundry"
  service_name     = "cloudfoundry"
  plan_name        = "trial"
  landscape_label  = terraform_data.cf_landscape_label.output
  parameters = jsonencode({
    instance_name = "${local.cf-name}-param"
  })
}