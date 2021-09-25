# locals {
#   nameservers = concat(
#     [
#       "ns1.digitalocean.com",
#       "ns2.digitalocean.com",
#       "ns3.digitalocean.com",
#     ],
#     google_dns_managed_zone.this.name_servers,
#   )
# }

# resource "namecheap_domain_records" "this" {
#   domain = "248.sh"
#   mode   = "OVERWRITE"

#   nameservers = local.nameservers
# }
