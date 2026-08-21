# Root terragrunt.hcl

locals {
  # Automatically load environment-level variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Automatically load tenant-level variables if they exist
  # This allows us to use the same logic for tenant-specific and global resources
  tenant_vars = read_terragrunt_config(find_in_parent_folders("tenant.hcl", "tenant.hcl"), { locals = { tenant_id = "global" } })

  # Extract variables for easy access
  aws_region = local.env_vars.locals.aws_region
  environment = local.env_vars.locals.environment
  tenant_id   = local.tenant_vars.locals.tenant_id
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  allowed_account_ids = ["${local.env_vars.locals.aws_account_id}"]

  # Default tags to apply to all resources
  default_tags {
    tags = {
      Environment = "${local.environment}"
      Tenant      = "${local.tenant_id}"
      ManagedBy   = "Terraform"
      Project     = "IdealFoundation"
    }
  }
}
EOF
}

# Configure Terragrunt to use a local backend for now
# This can be easily switched to S3 in the future
remote_state {
  backend = "local"
  config = {
    path = "${get_parent_terragrunt_dir()}/terraform.tfstate.d/${path_relative_to_include()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Combine all variables into a single map to be passed as inputs to modules
inputs = merge(
  local.env_vars.locals,
  local.tenant_vars.locals,
)
