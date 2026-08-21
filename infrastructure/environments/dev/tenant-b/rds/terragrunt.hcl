include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_terragrunt_dir()}/../../../_envcommon/rds.hcl"
  expose = true
}

dependency "vpc" {
  config_path = "../vpc"
  
  mock_outputs = {
    database_subnets          = ["subnet-mock1", "subnet-mock2"]
    default_security_group_id = "sg-mock"
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

inputs = {
  subnet_ids             = dependency.vpc.outputs.database_subnets
  vpc_security_group_ids = [dependency.vpc.outputs.default_security_group_id]

  # EDGE CASE DEMO: Overriding _envcommon defaults!
  # _envcommon sets multi_az = false and instance_class = db.t4g.micro.
  # We override it here just for tenant-b!
  multi_az       = true
  instance_class = "db.t4g.small"
}
