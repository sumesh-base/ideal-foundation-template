# Ideal Foundation Template

This repository contains the enterprise-ready infrastructure code (using Terragrunt and Terraform) for the Ideal Foundation project.

## Architecture & Workflows

This repository has been supercharged with an enterprise-grade CI/CD release process designed for high-scale multi-account AWS deployments.

### 1. Dynamic Matrix Pipelines
The deployment pipeline (`.github/workflows/infrastructure.yml`) uses a **Dynamic Matrix Strategy**.
- It automatically discovers all environment folders (e.g., `dev`, `prod`) under `infrastructure/environments/`.
- It executes `terragrunt plan` and `terragrunt apply` in parallel, isolated matrix runners for each environment.
- This entirely eliminates the blast radius risks and timeout issues associated with running monolithic `terragrunt run-all` commands across dozens of AWS accounts.

### 2. Automated Pull Request Plan Summaries
When a Pull Request is opened, the GitHub Action automatically runs `terragrunt plan` and parses the output. 
- It posts a **Markdown Table Summary** directly as a comment on the PR (detailing resources to add, change, and destroy).
- It includes a collapsible `<details>` section containing the full detailed plan for easy code review.

### 3. AWS OIDC Security & Isolation
Authentication to AWS is handled securely via **OpenID Connect (OIDC)**, completely eliminating long-lived AWS credentials.
- The pipeline uses `aws-actions/configure-aws-credentials@v6`.
- The AWS IAM Role Trust Policy is strictly bound to this GitHub repository and uses wildcard casing logic to safely handle `AssumeRoleWithWebIdentity` requests without case-sensitivity errors.

### 4. Branch Protection & PR Validation
The `main` branch is strictly protected.
- **Direct pushes are disabled.** All changes must be submitted via Pull Request.
- **Mandatory Approvals:** At least 1 approving review is required before merging.
- **Required Status Checks:** The `Terragrunt Plan` action must pass successfully before a merge is permitted.
- **Jira Branch Enforcement:** The `PR Validation` workflow ensures that your working branch name contains a Jira ticket reference (e.g., `PROJ-123`).

### 5. Automated Versioning (Release Please)
Live infrastructure repositories can suffer from "commit clutter". We have integrated **Release Please** (`.github/workflows/release-please.yml`).
- As you merge Conventional Commits (e.g., `feat: added VPC module`) into `main`, Release Please automatically drafts a Release PR.
- Merging the Release PR automatically cuts semantic version tags and maintains a centralized `CHANGELOG.md` for the infrastructure.

### 6. Dependency Maintenance
A `.github/dependabot.yml` configuration is included to ensure that both **GitHub Actions** and **Terraform Modules** are automatically kept up-to-date on a weekly schedule.

## Usage
To add a new environment, simply create a new folder under `infrastructure/environments/`. The matrix pipeline will automatically discover it on your next push!
