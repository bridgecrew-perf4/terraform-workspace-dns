# from do variable set
variable "do_region" {
  type = string
}
variable "do_token" {
  sensitive = true
  type      = string
}

# from nc variable set
variable "nc_user_name" {
  type = string
}
variable "nc_api_user" {
  type = string
}
variable "nc_api_key" {
  sensitive = true
  type      = string
}