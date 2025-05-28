variable "globalaccount" {
  description = "Subdomain of the global account."
  type        = string
}

variable "subaccount_name" {
  description = "Name of the subaccount"
  type        = string
  default     = "DEV Project ABC"
}

variable "subaccount_subdomain" {
  description = "Subdomain of the subaccount"
  type        = string
  default     = "dev-project-marc-beuter"
}

variable "subaccount_region" {
  description = "Region of the subaccount"
  type        = string
  default     = "us10"
  validation {
    condition     = contains(["us10", "ap21"], var.subaccount_region)
    error_message = "The subaccount region must be either 'us10' or 'ap21'."
  }
}

variable "subaccount_beta_enabled" {
  description = "Beta feaatures enabled on subaccount"
  type        = bool
  default     = true
}

variable "subaccount_stage" {
  description = "Stage of the subaccount"
  type        = string
  default     = "DEV"
  validation {
    condition     = contains(["DEV", "TEST", "PORD"], var.subaccount_stage)
    error_message = "The subaccount stage must be either 'DEV', 'TEST', or 'PORD'."
  }
}

variable "project_costcenter" {
  description = "Cost center of the project"
  type        = string
  default     = "12345"
  validation {
    condition     = can(regex("^[0-9]{5}$", var.project_costcenter))
    error_message = "The project cost center must be a 5-digit number."
  }
}