output "subaccount_id" {
  value = btp_subaccount.project_subaccount.id

}

output "landscape_label" {
  value = btp_subaccount_environment_instance.cloudfoundry.landscape_label

}

output "cf_api_url" {
  value = jsondecode(btp_subaccount_environment_instance.cloudfoundry.labels)["API Endpoint"]

}

output "subaccount_url" {
  value       = "https://account.hanatrial.ondemand.com/trial/#/globalaccount/${data.btp_globalaccount.this.id}/subaccount/${btp_subaccount.project_subaccount.id}"
  description = "The SAP BTP subaccount URL"

}

output "cf_org_id" {
  value       = jsondecode(btp_subaccount_environment_instance.cloudfoundry.labels)["Org ID"]
  description = "The Cloud Foundry Org ID"

}