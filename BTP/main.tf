module "subaccount_base" {
  source             = "./modules/subaccount-baseline"
  subaccount_stage   = var.subaccount_stage
  project_name       = var.project_name
  subaccount_region  = var.subaccount_region
  project_costcenter = var.project_costcenter
}

module "standard_services" {
  source           = "./modules/srvc-baseline"
  subaccount_stage = var.subaccount_stage
  project_name     = var.project_name
  subaccount_id    = module.subaccount_base.subaccount_id

}



