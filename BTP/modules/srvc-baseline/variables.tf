variable "subaccount_stage" {
  description = "Stage of the subaccount, e.g., DEV, TST, PRD"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "subaccount_id" {
  description = "ID of the subaccount where services will be provisioned"
  type        = string

}