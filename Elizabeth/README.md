GROCERY_MATE – THREE_TIER ARCHITECHTURE ON AWS USING TERRAFORM

This project demonstrates how to deploy GroceryMate, a cloud-based grocery management and ordering platform, using a three-tier architecture on AWS provisioned with Terraform.

The architecture consists of:

WEB TIER – Hosts the GroceryMate frontend, allowing customers to browse products, manage carts, and place grocery orders.

APPLICATION TIER – Handles business logic such as order processing, inventory management, pricing, and user authentication.

DATABASE TIER – Stores persistent data including users, products, inventory levels, and order history.

The infrastructure is built using AWS services such as EC2, RDS, Elastic Load Balancer (ELB), Auto Scaling Groups (ASG), and a custom VPC to ensure scalability, high availability, and security.









Terraform modules are used to organize and manage the infrastructure code, enabling reusability, maintainability, and easy deployment across environments.

Prerequisites
Before you begin, ensure you have:

Basic knowledge of Terraform and AWS services such as EC2, ELB, ASG, RDS and VPC
Terraform installed on your local machine
An AWS account
AWS CLI configured with appropriate IAM user credentials (secret access key and access key ID)
Steps

1. Clone the repository
git clone https://github.com/chrisdaron2-hue/AWS_grocery.git)

3. Change to the project folder
cd AWS_grocery

4. Create S3 bucket to store the state file
Create S3 bucket for backend to store Terraform state file. The S3 bucket can be created with either

The configuration in ./s3-bucket.tf file
Through the AWS management console

terraform fmt

5. Initialize Terraform
terraform init
terraform plan
terraform apply

7. Plan the deployment terraform plan
Run the following command to see all resources terraform will create and check if matches your expection

terraform plan
7. Deploy the infrastructure
terraform apply

8. Access the Application
After deployment is complete, the web application can be access via the Elastic Load Balancer's DNS name. Copy the DNS name Terraform will output and paste it into your web browser.

11. Confirm Infrastructure
Login to AWS console to confirm all the resources created


<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 50 46" src="https://github.com/user-attachments/assets/bc27d866-00ef-47ad-8064-4c38313420da" />
<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 50 24" src="https://github.com/user-attachments/assets/9034cba6-ad4c-415d-aa1a-cab00a446b6c" /><img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 51 46" src="https://github.com/user-attachments/assets/bd067475-95b3-4fe3-9d54-0e1bb8054cac" />
<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 52 34" src="https://github.com/user-attachments/assets/6e90a5ed-badb-40d0-8672-d8f61711de79" />

<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 53 25" src="https://github.com/user-attachments/assets/09f60a62-5b58-4f09-ab63-e752324f3d78" />
<img width="1470" height="956" alt="Screenshot 2026-01-07 at 19 55 05" src="https://github.com/user-attachments/assets/d19ba18f-173e-4d44-bc59-b04cceb3165c" />


