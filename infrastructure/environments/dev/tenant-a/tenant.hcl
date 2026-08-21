# tenant.hcl for tenant-a
locals {
  tenant_id = "tenant-a"
  # Add tenant-specific configurations here (e.g. custom CIDRs, domain names)
  vpc_cidr  = "10.10.0.0/16"
}
