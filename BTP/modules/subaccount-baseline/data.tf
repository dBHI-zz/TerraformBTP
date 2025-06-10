data "btp_globalaccount" "this" {}

data "btp_subaccount_environments" "all_environments" {
  subaccount_id = btp_subaccount.project_subaccount.id
}