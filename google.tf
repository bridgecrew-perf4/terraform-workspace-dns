resource "google_dns_managed_zone" "this" {
  provider = google.this

  dns_name = "248.sh."
  name     = "main"

  dnssec_config {
    non_existence = "nsec"
    state         = "on"
  }
}

resource "google_dns_record_set" "dkim" {
  provider = google.this

  managed_zone = google_dns_managed_zone.this.name
  name         = "google._domainkey.${google_dns_managed_zone.this.dns_name}"
  ttl          = 300
  type         = "TXT"

  rrdatas = [
    "\"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCg3DM5oR+MMaDwLu2HB1E9HDQzZw23jFwLs83g3KdIlZyf4lG7QoxHJg2OsMSnFJHw0wkE6z3xmKyyr2TimU+ZeLmM0OpKAvt/sccU6x51DCD5n4Yx0SN/ufllcHK5O2qIJofAfke9w8eGYRs6lFz3s3WYz8DGb1FnfvVjxFbYeQIDAQAB\"",
  ]
}
resource "google_dns_record_set" "dmarc" {
  provider = google.this

  managed_zone = google_dns_managed_zone.this.name
  name         = "_dmarc.${google_dns_managed_zone.this.dns_name}"
  ttl          = 300
  type         = "TXT"

  rrdatas = [
    "\"v=DMARC1; p=quarantine; pct=100; rua=mailto:postmaster@248.sh\"",
  ]
}
resource "google_dns_record_set" "github" {
  provider = google.this

  managed_zone = google_dns_managed_zone.this.name
  name         = "_github-challenge-248-sh.${google_dns_managed_zone.this.dns_name}"
  ttl          = 300
  type         = "TXT"

  rrdatas = [
    "9894865c7b",
  ]
}
# resource "google_dns_record_set" "hetzner" {
#   provider = google.this

#   managed_zone = google_dns_managed_zone.this.name
#   name         = "hetzner.${google_dns_managed_zone.this.dns_name}"
#   ttl          = 300
#   type         = "A"

#   rrdatas = [
#     "116.203.51.107",
#   ]
# }
# resource "google_dns_record_set" "keybase" {
#   provider = google.this

#   managed_zone = google_dns_managed_zone.this.name
#   name         = "_keybase.${google_dns_managed_zone.this.dns_name}"
#   ttl          = 300
#   type         = "TXT"

#   rrdatas = [
#     "\"keybase-site-verification=5wI0Zf9xB0OjKs90TBQbN6dbm9sGh68Vi6d4Hzmkpzo\"",
#   ]
# }
# resource "google_dns_record_set" "mta_sts" {
#   provider = google.this

#   managed_zone = google_dns_managed_zone.this.name
#   name         = "_mta-sts.${google_dns_managed_zone.this.dns_name}"
#   ttl          = 300
#   type         = "TXT"

#   rrdatas = [
#     "\"v=STSv1; id=1607724467851\"",
#   ]
# }
resource "google_dns_record_set" "mx" {
  provider = google.this

  managed_zone = google_dns_managed_zone.this.name
  name         = google_dns_managed_zone.this.dns_name
  ttl          = 300
  type         = "MX"

  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com.",
  ]
}
# resource "google_dns_record_set" "smtp_tls" {
#   provider = google.this

#   managed_zone = google_dns_managed_zone.this.name
#   name         = "_smtp._tls.${google_dns_managed_zone.this.dns_name}"
#   ttl          = 300
#   type         = "TXT"

#   rrdatas = [
#     "\"v=TLSRPTv1; rua=mailto:smtp-tls-reports@248.sh\"",
#   ]
# }
resource "google_dns_record_set" "spf" {
  provider = google.this

  managed_zone = google_dns_managed_zone.this.name
  name         = google_dns_managed_zone.this.dns_name
  ttl          = 300
  type         = "TXT"

  rrdatas = [
    "\"v=spf1 include:_spf.google.com ~all\"",
    "\"google-site-verification=Uqij4CHRNz1-YppWOG1gwZFLUcdLcn4x6ScFtXZBGMI\"",
  ]
}
