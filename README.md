# GroceryMate – Three-Tier Architecture on AWS Using Terraform

[![Terraform](https://img.shields.io/badge/Terraform-1.5+-blue?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)


GroceryMate is a cloud-based grocery management and ordering platform deployed using a **three-tier architecture** on AWS with **Terraform**.



<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/94140e34-2f4c-4b9a-8568-135f44c81953" />


---

## Table of Contents

1. [Architecture Overview](#architecture-overview)  
2. [Prerequisites](#prerequisites)  
3. [Setup Instructions](#setup-instructions)  
4. [Terraform Outputs](#terraform-outputs)  
5. [Usage](#usage)  
6. [Deployment Workflow](#deployment-workflow)  
7. [Verify Infrastructure](#verify-infrastructure)  


---

## Architecture Overview

The three-tier architecture consists of:

- **Web Tier:** Hosts the frontend for customers to browse products, manage carts, and place orders.  
- **Application Tier:** Handles business logic such as order processing, inventory, pricing, and authentication.  
- **Database Tier:** Stores persistent data including users, products, inventory levels, and order history.  

**AWS Services Used:**

- EC2 (Compute)  
- RDS (Database)  
- Elastic Load Balancer (ELB)  
- Auto Scaling Groups (ASG)  
- S3 (Storage)  
- Custom VPC (Network isolation)

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/76b078c2-3491-4949-8617-95edd8a6af1e" />


## Terraform modules are used for **reusability**, **maintainability**, and easy deployment across environments.

---

## Infrastructure Overview


This project uses **Terraform** to provision and deploy the **Grocery_mate** infrastructure on **AWS**.  
The infrastructure is designed for **scalability**, **high availability**, and **security**, leveraging core AWS services such as EC2, RDS, ELB/ALB, Auto Scaling Groups, S3, and a custom VPC.

Together, these components form a resilient and flexible cloud architecture capable of handling varying workloads while maintaining performance and reliability.


Terraform modules are used to organize and manage the infrastructure code, enabling reusability, maintainability, and easy deployment across environments.
 
## Prerequisites

### Before deploying, ensure you have

- AWS account with sufficient IAM permissions
 
- AWS CLI
  
- Terraform-1.5.0
  
- Git


---






Ensure the following are installed and configured:

## Installation – Grocery_mate (Terraform)

Configure AWS credentials:

```bash
aws configure

```

```bash
aws sso login
```

---

## Setup Instructions

 
1. **Clone the repository**

Clone the repository git clone https://github.com/chrisdaron2-hue/AWS_grocery.git)

Change to the project folder cd AWS_grocery

Create S3 bucket to store the state file Create S3 bucket for backend to store Terraform state file. The S3 bucket can be created with either

The configuration in ./s3-bucket.tf file Through the AWS management console



terraform fmt

Initialize Terraform

---


## Terraform Setup

Clone the repository: 


     git clone https://github.com/chrisdaron2-hue/AWS_grocery.git
           

     cd AWS_grocery/infrastructure


```bash
git clone https://github.com/chrisdaron2-hue/AWS_grocery.git
cd AWS_grocery/infrastructure


Initialize Terraform:

---


• Initialize Terraform:

   terraform init

• Review the Terraform plan:

   terraform plan

• Apply the Terraform plan:

   terraform apply

Enter your RDS password when prompted.


## Terraform Outputs

| Output | Example Value | Description |
|--------|---------------|-------------|
| `aws_region` | `eu-central-1` | AWS region where resources are deployed |
| `db_endpoint` | `terraform-xxxx.rds.amazonaws.com:5432` | RDS database endpoint |
| `db_instance_id` | `db-xxxxxxxx` | RDS instance ID |
| `ec2_instance_id` | `i-xxxxxxxx` | EC2 instance ID |
| `ec2_public_ip` | `63.178.191.196` | Public IP of the EC2 instance |
| `avatars_bucket_name` | `grocerymate-avatars-elizabeth-dev-eu` | S3 bucket for avatars |


## Usage





SSH into the EC2 instance:

```bash
ssh -i <your-key.pem> ec2-user@<your_ec2_public_ip>
```

Connect to PostgreSQL:

```bash
psql -h <db_endpoint> -U <db_username> -d <db_name>
```

Access S3 bucket via AWS CLI or console



Plan the deployment terraform plan Run the following command to see all resources terraform will create and check if matches your expection
terraform plan

Deploy the infrastructure terraform apply

Access the Application After deployment is complete, the web application can be access via the Elastic Load Balancer's DNS name. Copy the DNS name Terraform will output and paste it into your web browser.

Confirm Infrastructure Login to AWS console to confirm all the resources created

<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 50 46" src="https://github.com/user-attachments/assets/bc27d866-00ef-47ad-8064-4c38313420da" />
<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 50 24" src="https://github.com/user-attachments/assets/9034cba6-ad4c-415d-aa1a-cab00a446b6c" /><img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 51 46" src="https://github.com/user-attachments/assets/bd067475-95b3-4fe3-9d54-0e1bb8054cac" />
<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 52 34" src="https://github.com/user-attachments/assets/6e90a5ed-badb-40d0-8672-d8f61711de79" />

<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 53 25" src="https://github.com/user-attachments/assets/09f60a62-5b58-4f09-ab63-e752324f3d78" />
<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 55 05" src="https://github.com/user-attachments/assets/d19ba18f-173e-4d44-bc59-b04cceb3165c" />
 (Fix formatting of SSH and PostgreSQL commands)


