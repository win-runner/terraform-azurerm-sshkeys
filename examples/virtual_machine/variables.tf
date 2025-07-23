variable "name" {
  description = "The name of the resources, deployed by this example."
  type        = string
  default     = "iacws-tf-04"
}

variable "environment_short" {
  description = "The short name of the environment."
  type        = string
  default     = "demo"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "swedencentral"
}

variable "tags" {
  description = "Map of default tags, used as standard for the whole project."
  type        = map(string)
  default     = {}
}
