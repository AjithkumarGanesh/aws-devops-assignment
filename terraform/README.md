
# AWS DevOps Assignment – Terraform Infrastructure

## 1. Project Overview

This project provisions AWS infrastructure using Terraform.

- AWS Region: ap-south-1
- VPC with public and private subnets
- Internet Gateway and Route Tables
- Security Group
- EC2 instance running Nginx
- S3 bucket for remote Terraform state
- Reusable Terraform network module

## 2. Project Structure

```text
terraform/
├── backend.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── s3-backend.tf
├── variables.tf
├── versions.tf
├── .gitignore
└── modules/
    └── network/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## 3. Prerequisites

- AWS Account
- AWS CLI
- Terraform
- Git
- Configured AWS credentials

## 4. Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Format configuration:

```bash
terraform fmt -recursive
```

Validate configuration:

```bash
terraform validate
```

Review execution plan:

```bash
terraform plan
```

Deploy infrastructure (only after reviewing the plan):

```bash
terraform apply
```

## 5. Remote State Management

Terraform state is stored in Amazon S3.

- Bucket: ajithkumar-devops-terraform-state-2026
- Region: ap-south-1
- State key: dev/terraform.tfstate
- Encryption: Enabled
- Versioning: Enabled
- State locking: S3 native lockfile (`use_lockfile = true`)

This project uses native S3 state locking instead of the older DynamoDB-based locking method.

## 6. Reusable Network Module

The network module is reused for Development and Staging environments.

| Environment | VPC CIDR | Public Subnet | Private Subnet |
|---|---|---|---|
| Development | 10.0.0.0/16 | 10.0.1.0/24 | 10.0.2.0/24 |
| Staging | 10.1.0.0/16 | 10.1.1.0/24 | 10.1.2.0/24 |

The module creates VPCs, subnets, Internet Gateways, route tables, route table associations, and Security Groups.

## 7. Terraform Plan Output

Latest Terraform plan:

```text
Plan: 9 to add, 0 to change, 0 to destroy.
```

The nine planned resources belong to the Staging network module. They have not been deployed.

The existing Development infrastructure has no planned changes.

## 8. Cleanup

After completing the assignment and confirming that the infrastructure is no longer required:

```bash
terraform destroy
```

Review the proposed deletions before confirming.
