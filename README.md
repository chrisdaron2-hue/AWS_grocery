GROCERY_MATE – THREE_TIER ARCHITECHTURE ON AWS USING TERRAFORM

This project demonstrates how to deploy GroceryMate, a cloud-based grocery management and ordering platform, using a three-tier architecture on AWS provisioned with Terraform.

The architecture consists of:

WEB TIER – Hosts the GroceryMate frontend, allowing customers to browse products, manage carts, and place grocery orders.

APPLICATION TIER – Handles business logic such as order processing, inventory management, pricing, and user authentication.

DATABASE TIER – Stores persistent data including users, products, inventory levels, and order history.

The infrastructure is built using AWS services such as EC2, RDS, Elastic Load Balancer (ELB), Auto Scaling Groups (ASG), and a custom VPC to ensure scalability, high availability, and security.

Terraform modules are used to organize and manage the infrastructure code, enabling reusability, maintainability, and easy deployment across environments.

Prerequisites Before you begin, ensure you have:

Basic knowledge of Terraform and AWS services such as EC2, ELB, ASG, RDS and VPC Terraform installed on your local machine An AWS account AWS CLI configured with appropriate IAM user credentials (secret access key and access key ID) Steps

Clone the repository git clone https://github.com/chrisdaron2-hue/AWS_grocery.git)

Change to the project folder cd AWS_grocery

Create S3 bucket to store the state file Create S3 bucket for backend to store Terraform state file. The S3 bucket can be created with either

The configuration in ./s3-bucket.tf file Through the AWS management console

terraform fmt

Initialize Terraform
terraform init

terraform plan

terraform apply

Plan the deployment terraform plan Run the following command to see all resources terraform will create and check if matches your expection
terraform plan

Deploy the infrastructure terraform apply

Access the Application After deployment is complete, the web application can be access via the Elastic Load Balancer's DNS name. Copy the DNS name Terraform will output and paste it into your web browser.

Confirm Infrastructure Login to AWS console to confirm all the resources created

Screenshot 2026-01-07 at 19 50 46 Screenshot 2026-01-07 at 19 50 24Screenshot 2026-01-07 at 19 51 46 Screenshot 2026-01-07 at 19 52 34 Screenshot 2026-01-07 at 19 53 25 Screenshot 2026-01-07 at 19 55 05
