data "digitalocean_project" "this" {
  name = "248-sh"
}

resource "digitalocean_domain" "this" {
  name = "248.sh"
}

resource "digitalocean_record" "dkim" {
  domain = digitalocean_domain.this.name
  name   = "google._domainkey"
  ttl    = 300
  type   = "TXT"

  value = "\"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCg3DM5oR+MMaDwLu2HB1E9HDQzZw23jFwLs83g3KdIlZyf4lG7QoxHJg2OsMSnFJHw0wkE6z3xmKyyr2TimU+ZeLmM0OpKAvt/sccU6x51DCD5n4Yx0SN/ufllcHK5O2qIJofAfke9w8eGYRs6lFz3s3WYz8DGb1FnfvVjxFbYeQIDAQAB\""
}
resource "digitalocean_record" "dmarc" {
  domain = digitalocean_domain.this.name
  name   = "_dmarc"
  ttl    = 300
  type   = "TXT"

  value = "\"v=DMARC1; p=quarantine; pct=100; rua=mailto:postmaster@248.sh\""
}
resource "digitalocean_record" "github" {
  domain = digitalocean_domain.this.name
  name   = "_github-challenge-248-sh"
  ttl    = 300
  type   = "TXT"

  value = "9894865c7b"
}
# resource "digitalocean_record" "hetzner" {
#   domain = digitalocean_domain.this.name
#   name         = "hetzner"
#   ttl          = 300
#   type         = "A"

#   value = "116.203.51.107"
# }
# resource "digitalocean_record" "keybase" {
#   domain = digitalocean_domain.this.name
#   name         = "_keybase"
#   ttl          = 300
#   type         = "TXT"

#   value = "\"keybase-site-verification=5wI0Zf9xB0OjKs90TBQbN6dbm9sGh68Vi6d4Hzmkpzo\""
# }
# resource "digitalocean_record" "mta_sts" {
#   domain = digitalocean_domain.this.name
#   name         = "_mta-sts"
#   ttl          = 300
#   type         = "TXT"

#   value = "\"v=STSv1; id=1607724467851\""
# }
resource "digitalocean_record" "mx" {
  for_each = {
    "aspmx.l.google.com."      = 1,
    "alt1.aspmx.l.google.com." = 5,
    "alt2.aspmx.l.google.com." = 5,
    "alt3.aspmx.l.google.com." = 10,
    "alt4.aspmx.l.google.com." = 10,
  }

  domain = digitalocean_domain.this.name
  name   = "@"
  ttl    = 300
  type   = "MX"

  priority = each.value
  value    = each.key
}
# resource "digitalocean_record" "smtp_tls" {
#   domain = digitalocean_domain.this.name
#   name         = "_smtp._tls"
#   ttl          = 300
#   type         = "TXT"

#   value = "\"v=TLSRPTv1; rua=mailto:smtp-tls-reports@248.sh\""
# }
resource "digitalocean_record" "spf" {
  for_each = toset([
    "\"v=spf1 include:_spf.google.com ~all\"",
    "\"google-site-verification=Uqij4CHRNz1-YppWOG1gwZFLUcdLcn4x6ScFtXZBGMI\"",
  ])

  domain = digitalocean_domain.this.name
  name   = "@"
  ttl    = 300
  type   = "TXT"

  value = each.value
}

resource "digitalocean_project_resources" "domains" {
  project = data.digitalocean_project.this.id
  resources = [
    digitalocean_domain.this.urn,
  ]
}
