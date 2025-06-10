resource "random_uuid" "uuid" {}

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