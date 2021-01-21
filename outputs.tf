output "this" {
  value = google_dns_managed_zone.this
}
output "this_hostname" {
  value = local.this_hostname
}
output "sandbox" {
  value = google_dns_managed_zone.sandbox
}
output "sandbox_hostname" {
  value = local.sandbox_hostname
}
