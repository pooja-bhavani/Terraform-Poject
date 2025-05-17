# Terraform Project

## Architecture Diagram

```
graph TD
    %% Define the environments
    subgraph "Development Environment"
        dev_ec2[EC2 Instance]
        dev_s3[S3 Bucket]
        dev_dynamo[DynamoDB Table]
    end

    subgraph "Staging Environment"
        stg_ec2[EC2 Instance]
        stg_s3[S3 Bucket]
        stg_dynamo[DynamoDB Table]
    end

    subgraph "Production Environment"
        prod_ec2_1[EC2 Instance 1]
        prod_ec2_2[EC2 Instance 2]
        prod_ec2_3[EC2 Instance 3]
        prod_s3_1[S3 Bucket 1]
        prod_s3_2[S3 Bucket 2]
        prod_dynamo[DynamoDB Table]
    end

    %% Define relationships
    dev_ec2 --> dev_s3
    dev_ec2 --> dev_dynamo

    stg_ec2 --> stg_s3
    stg_ec2 --> stg_dynamo

    prod_ec2_1 --> prod_s3_1
    prod_ec2_2 --> prod_s3_1
    prod_ec2_3 --> prod_s3_2
    prod_ec2_1 --> prod_dynamo
    prod_ec2_2 --> prod_dynamo
    prod_ec2_3 --> prod_dynamo
```

![image](https://github.com/user-attachments/assets/8ef94553-e38e-4cc0-8c43-9a3565111093)

## Terraform Implementation

This project uses Terraform workspaces to manage multiple environments (Dev, Stg, Prod).

### Project Structure
- `main.tf` - Main configuration file with resource definitions
- `variables.tf` - Input variables
- `locals.tf` - Local variables for environment configurations
- `outputs.tf` - Output values

### Usage Instructions

1. Initialize Terraform:
   ```
   terraform init
   ```

2. Create and select a workspace:
   ```
   terraform workspace new dev
   terraform workspace new stg
   terraform workspace new prod
   terraform workspace select dev
   ```

3. Deploy resources:
   ```
   terraform plan
   terraform apply
   ```

4. To switch environments:
   ```
   terraform workspace select stg
   terraform apply
   ```
