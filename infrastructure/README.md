# Infrastructure Management with Terragrunt

This directory contains the multi-environment, multi-tenant infrastructure managed by Terragrunt and Terraform.

## Directory Structure

- `terragrunt.hcl`: Root configuration for providers and backend.
- `environments/`: Contains all environment and tenant-specific configurations.
    - `_envcommon/`: DRY (Don't Repeat Yourself) module configurations shared across environments.
    - `dev/`, `prod/`: Environment folders.
        - `env.hcl`: Environment-specific variables (Region, Account ID).
        - `tenant-a/`, `tenant-b/`: Tenant-specific folders.
            - `tenant.hcl`: Tenant-specific variables (Tenant ID, custom CIDRs).
            - `vpc/`, `app/`: Module instances for this tenant.

## Developer Workflow

### 1. Adding a New Tenant
To add a new tenant (e.g., `tenant-b`) to the `dev` environment:

1. Create a new directory: `mkdir -p infrastructure/environments/dev/tenant-b`
2. Create `tenant.hcl` in that directory:
   ```hcl
   locals {
     tenant_id = "tenant-b"
     vpc_cidr  = "10.20.0.0/16"
   }
   ```
3. Create module directories (e.g., `vpc`):
   ```bash
   mkdir infrastructure/environments/dev/tenant-b/vpc
   ```
4. Create `terragrunt.hcl` in the `vpc` directory:
   ```hcl
   include "root" { path = find_in_parent_folders() }
   include "envcommon" { path = "${get_terragrunt_dir()}/../../../_envcommon/vpc.hcl" }
   ```

### 2. Local Execution
Ensure you have `terraform` and `terragrunt` installed and AWS credentials configured.

- **Plan all resources in dev**:
  ```bash
  cd infrastructure/environments/dev
  terragrunt run-all plan
  ```

- **Apply changes for a specific tenant module**:
  ```bash
  cd infrastructure/environments/dev/tenant-a/vpc
  terragrunt apply
  ```

## State Management
Currently, state is stored **locally** in `infrastructure/terraform.tfstate.d/`. 
**Warning:** Local state is not shared between team members or CI/CD runs. 

To switch to S3 (recommended for production), update the `remote_state` block in the root `infrastructure/terragrunt.hcl`.

## GitHub Actions
A workflow is configured in `.github/workflows/infrastructure.yml` to automatically:
- Run `terragrunt plan` on Pull Requests.
- Run `terragrunt apply` on merges to `main`.

Authentication is handled via AWS OIDC using the role: `arn:aws:iam::496411573458:role/sumesh-github-actions-aws-role`.
Trigger action
Test PR comment
