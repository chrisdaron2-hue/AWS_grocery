GroceryMate – Three-Tier Architecture on AWS using Terraform

This project demonstrates how to deploy GroceryMate, a cloud-based grocery management and ordering platform, using a three-tier architecture on AWS provisioned with Terraform.

The architecture consists of:

Web Tier – Hosts the GroceryMate frontend, allowing customers to browse products, manage carts, and place grocery orders.

Application Tier – Handles business logic such as order processing, inventory management, pricing, and user authentication.

Database Tier – Stores persistent data including users, products, inventory levels, and order history.

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
git clone https://github.com/theglad-x/Three-Tier-Architecture-Deployment-on-AWS-with-Terraform.git
2. Change to the project folder
cd Three-Tier-Architecture-Deployment-on-AWS-with-Terraform
3. Create S3 bucket to store the state file
Create S3 bucket for backend to store Terraform state file. The S3 bucket can be created with either

The configuration in ./s3-bucket.tf file
Through the AWS management console
4. Configure email for ASG notification
Open in a text editor main.tf file in the project root directory and configure your email for web tier and app tier ASG notification

5. Configure Terraform Variables
In the project root directory, open terraform.tfvars in a text editor Review and customize the values of the variables according to your reguirement.

image_name: Set the value for ami filter
my_public_key: Set location of the public key for keypair
db_password: Set the database password
db_username: Set username for the database
ip: Set ip for the host machine
6. Formate configuration files
Run fmt command to fix any syntax error

terraform fmt
7. Initialize Terraform
terraform init
8. Plan the deployment terraform plan
Run the following command to see all resources terraform will create and check if matches your expection

terraform plan
9. Deploy the infrastructure
terraform apply
10. Access the Application
After deployment is complete, the web application can be access via the Elastic Load Balancer's DNS name. Copy the DNS name Terraform will output and paste it into your web browser.

11. Confirm Infrastructure
Login to AWS console to confirm all the resources created
