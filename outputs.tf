output "this" {
  value = {
    do  = digitalocean_domain.this,
    gcp = google_dns_managed_zone.this,
    # nc  = namecheap_domain_records.this,
  }
}
