# AWS Infrastructure Automation with Terraform

An introductory Infrastructure as Code (IaC) project demonstrating the automated provisioning and management of cloud resources on AWS using HashiCorp Terraform. This project serves as a foundational component of my Cloud Engineering portfolio, illustrating fundamental DevOps workflows and lifecycle management.

## 🚀 Project Overview

This configuration automates the deployment of a single elastic compute cloud (EC2) instance running Amazon Linux inside the `us-east-1` (N. Virginia) region. It follows professional cloud compliance by isolating sensitive state files locally via targeted exclusions.

## 🛠️ Tech Stack & Prerequisites

* **Cloud Provider:** Amazon Web Services (AWS)
* **Infrastructure as Code:** Terraform CLI (v1.x)
* **Editor:** Visual Studio Code

## 📐 Terraform Workflow Applied

The deployment safely followed the standard declarative infrastructure lifecycle:

1.  **Initialization (`terraform init`):** Configured the working directory and downloaded the required HashiCorp AWS provider plugins.
2.  **Validation (`terraform validate`):** Validated the configuration syntax to ensure compliance with HashiCorp Configuration Language (HCL).
3.  **Planning (`terraform plan`):** Generated an execution plan, confirming that `1 resource to add` matched the exact cloud target without drift.
4.  **Application (`terraform apply`):** Provisioned the `aws_instance` resource into the live AWS environment securely.
5.  **Destruction (`terraform destroy`):** Executed a full cleanup cycle to destroy live resources, adhering to cloud cost-optimization best practices.

## 📂 Repository Structure

* `main.tf`: Core HCL configuration specifying provider requirements and EC2 resources.
* `.gitignore`: Strict exclusion file preventing sensitive data leakage (e.g., local `.tfstate` maps) into version control.