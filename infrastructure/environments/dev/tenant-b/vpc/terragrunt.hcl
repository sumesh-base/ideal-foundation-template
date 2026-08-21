include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_terragrunt_dir()}/../../../_envcommon/vpc.hcl"
  expose = true
}

inputs = {
  cidr = include.envcommon.locals.tenant_vars.locals.vpc_cidr
  
  private_subnets  = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
  public_subnets   = ["10.30.101.0/24", "10.30.102.0/24", "10.30.103.0/24"]
  database_subnets = ["10.30.21.0/24", "10.30.22.0/24", "10.30.23.0/24"]
}
