# GroceryMate – Three-Tier Architecture on AWS Using Terraform

[![Terraform](https://img.shields.io/badge/Terraform-1.5+-blue?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

GroceryMate is a cloud-based grocery management and ordering platform deployed using a **three-tier architecture** on AWS with **Terraform**.

---

## Table of Contents

1. [Architecture Overview](#architecture-overview)  
2. [Prerequisites](#prerequisites)  
3. [Setup Instructions](#setup-instructions)  
4. [Terraform Outputs](#terraform-outputs)  
5. [Usage](#usage)  
6. [Deployment Workflow](#deployment-workflow)  
7. [Verify Infrastructure](#verify-infrastructure)  
8. [Notes](#notes)

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

Terraform modules are used for **reusability**, **maintainability**, and easy deployment across environments.

---

## Prerequisites

Before deploying, ensure you have:

- Terraform >= 1.5.0 installed  
- AWS CLI configured with IAM credentials  
- Git installed  
- AWS account  
- Basic understanding of Terraform and AWS services (EC2, RDS, ELB, ASG, VPC)  

---

## Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/chrisdaron2-hue/AWS_grocery.git
cd AWS_grocery/infrastructure

