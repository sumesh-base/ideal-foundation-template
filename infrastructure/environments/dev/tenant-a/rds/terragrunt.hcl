include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_terragrunt_dir()}/../../../_envcommon/rds.hcl"
  expose = true
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  subnet_ids             = dependency.vpc.outputs.database_subnets
  vpc_security_group_ids = [dependency.vpc.outputs.default_security_group_id]
}
