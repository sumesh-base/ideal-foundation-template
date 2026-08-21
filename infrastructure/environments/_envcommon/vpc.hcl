# Common configuration for VPC across all environments and tenants
# Using the public module: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

locals {
  # Load environment variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  
  # Load tenant variables
  tenant_vars = read_terragrunt_config(find_in_parent_folders("tenant.hcl"))

  environment = local.env_vars.locals.environment
  tenant_id   = local.tenant_vars.locals.tenant_id
  
  # Base name for resources
  name = "vpc-${local.environment}-${local.tenant_id}"
}

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.13.0"
}

inputs = {
  name = local.name
  
  # Use CIDRs that follow a pattern based on environment/tenant if needed
  # For now, we'll let the specific terragrunt.hcl override these if needed
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  
  create_database_subnet_group = true

  enable_nat_gateway = true
  single_nat_gateway = true # Cost saving for dev/small tenants

  tags = {
    Name = local.name
  }
}
