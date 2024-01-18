# variable "AWS_ACCESS_KEY_ID" {
#   default   = ""
#   sensitive = true
# }

# variable "AWS_SECRET_ACCESS_KEY" {
#   default   = ""
#   sensitive = true
# }

variable "project_name" {
  default = "eks-blue-green"
}

variable "region" {
  default = "ca-central-1"
}

variable "profile" {
  default = "default"
}