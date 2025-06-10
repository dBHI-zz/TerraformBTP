output "cf_landscape_label" {
  value       = module.subaccount_base.landscape_label
  description = "The Cloud Foundry landscape label."
}

output "cf_api_url" {
  value       = module.subaccount_base.cf_api_url
  description = "The Cloud Foundry API URL."
}

output "cf_org_id" {
  value       = module.subaccount_base.cf_org_id
  description = "The Cloud Foundry Org ID."
}

output "subaccount_url" {
  value       = module.subaccount_base.subaccount_url
  description = "The SAP BTP subaccount URL"
}