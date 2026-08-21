include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_terragrunt_dir()}/../../../_envcommon/vpc.hcl"
  expose = true
}

inputs = {
  cidr = include.envcommon.locals.tenant_vars.locals.vpc_cidr
  
  private_subnets  = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  public_subnets   = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]
  database_subnets = ["10.20.21.0/24", "10.20.22.0/24", "10.20.23.0/24"]
}
# Trigger
