# Common configuration for RDS across all environments and tenants
# Using the public module: https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest

locals {
  # Load environment variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  
  # Load tenant variables
  tenant_vars = read_terragrunt_config(find_in_parent_folders("tenant.hcl"))

  environment = local.env_vars.locals.environment
  tenant_id   = local.tenant_vars.locals.tenant_id
  
  # Base name for resources
  name = "rds-${local.environment}-${local.tenant_id}"
}

terraform {
  source = "tfr:///terraform-aws-modules/rds/aws?version=6.9.0"
}

inputs = {
  identifier = local.name

  engine               = "postgres"
  engine_version       = "16"
  family               = "postgres16"
  major_engine_version = "16"
  instance_class       = "db.t4g.micro"

  allocated_storage = 20
  
  db_name  = "ideal"
  username = "idealadmin"
  port     = 5432

  manage_master_user_password = true

  multi_az = false
  
  # Subnet group and security group should be passed by the specific environment
  create_db_subnet_group = true

  tags = {
    Name = local.name
  }
}
