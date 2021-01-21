resource "google_dns_managed_zone" "sandbox" {
  provider = google.this

  dns_name = "${local.sandbox_hostname}."
  name     = "sandbox"

  dnssec_config {
    non_existence = "nsec"
    state         = "on"
  }
}

resource "google_dns_record_set" "sandbox" {
  provider = google.this

  managed_zone = google_dns_managed_zone.this.name
  name         = google_dns_managed_zone.sandbox.dns_name
  ttl          = 300
  type         = "NS"

  rrdatas = google_dns_managed_zone.sandbox.name_servers
}
