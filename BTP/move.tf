moved {
  from = btp_subaccount.project_subaccount
  to   = module.subaccount_base.btp_subaccount.project_subaccount
}

moved {
  from = btp_subaccount_environment_instance.cloudfoundry
  to   = module.subaccount_base.btp_subaccount_environment_instance.cloudfoundry
}

moved {
  from = random_uuid.uuid
  to   = module.subaccount_base.random_uuid.uuid
}

moved {
  from = terraform_data.cf_landscape_label
  to   = module.subaccount_base.terraform_data.cf_landscape_label
}