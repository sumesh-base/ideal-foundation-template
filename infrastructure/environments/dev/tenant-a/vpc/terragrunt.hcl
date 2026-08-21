# VPC for tenant-a in dev environment

# Include the root terragrunt.hcl configuration
include "root" {
  path = find_in_parent_folders()
}

# Include the common VPC configuration
include "envcommon" {
  path   = "${get_terragrunt_dir()}/../../../_envcommon/vpc.hcl"
  expose = true
}

# Override specific inputs for this tenant/environment
inputs = {
  cidr = include.envcommon.locals.tenant_vars.locals.vpc_cidr
  
  # Adjust subnets based on the new CIDR
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
}
