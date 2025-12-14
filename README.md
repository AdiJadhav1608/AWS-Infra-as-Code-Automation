# 🚀 Infrastructure as Code on AWS using Terraform  
A complete, production-ready Infrastructure as Code (IaC) project built with **Terraform**, following modular design and GitHub CI/CD integration. This project provisions AWS resources such as **VPC, Subnets, EC2, S3, Security Groups**, with remote backend support using **S3 + DynamoDB**.

---

# 📘 **Project Overview**

This project demonstrates how to build scalable, maintainable, and automated AWS cloud infrastructure using **Infrastructure as Code (IaC)** principles.  
It follows best practices including:

- ✔ Modular Terraform architecture  
- ✔ Remote backend for state consistency  
- ✔ Automated provisioning using GitHub Actions  
- ✔ Reusable variables & workspaces  
- ✔ Cost optimization through instance selection  
- ✔ Easily extensible infrastructure for real-world cloud deployments  

---

# 🧱 **Features**

- 🌐 VPC with public subnet  
- 🚀 EC2 instance deployed in the public subnet  
- 🛡 Security group with SSH access  
- 📦 S3 bucket provisioning  
- 📁 Terraform remote backend stored in S3  
- 🔒 DynamoDB table used for state locking  
- ⚙️ GitHub Actions pipeline for automatic formatting, validation, planning, and apply  
- 🧩 Full modular design for reuse in other projects  

---

# 📁 **Project Structure**

```
terraform-aws-project/
│
├── backend/
│   └── backend.tf
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── s3/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
└── .github/
    └── workflows/
        └── terraform-ci.yml
```

---

# 🏗 **What This Infrastructure Creates**

| Resource | Description |
|---------|-------------|
| **VPC** | Custom VPC (10.0.0.0/16) |
| **Subnet** | Public subnet (10.0.1.0/24) |
| **Internet Gateway** | Enables outbound internet |
| **Route Table + Route** | Default route to IGW |
| **Security Group** | Allows SSH (port 22) |
| **EC2 Instance** | Amazon Linux 2 machine |
| **S3 Bucket** | For storing objects or backend |
| **Terraform Backend** | S3 + DynamoDB for state mgmt |
| **GitHub CI/CD** | Automates Terraform workflow |

---

# ⚙️ **Prerequisites**

Install the following:

- Terraform ≥ 1.3  
- AWS CLI  
- Git  
- GitHub account  
- IAM user with:  
  - `AmazonS3FullAccess`  
  - `AmazonEC2FullAccess`  
  - `AmazonVPCFullAccess`  
  - `AmazonDynamoDBFullAccess`  

---

# 🧰 **Setup AWS Backend Resources (Required Only Once)**

1. Create an S3 bucket:

```bash
aws s3api create-bucket --bucket my-terraform-backend-bucket-aditya --region ap-south-1 \
--create-bucket-configuration LocationConstraint=ap-south-1
```

2. Create a DynamoDB table for state locking:

```bash
aws dynamodb create-table \
  --table-name terraform-lock-table \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
```

---

# 🚀 **How to Run This Project**

## **1️⃣ Clone the repository**

```bash
git clone https://github.com/your-repo/terraform-aws-project.git
cd terraform-aws-project
```

---

## **2️⃣ Configure AWS Credentials**

```bash
aws configure
```

Enter:

- AWS Access Key  
- Secret Access Key  
- Region → `ap-south-1`

---

## **3️⃣ Initialize Terraform**

```bash
terraform init
```

This will:

- Download providers  
- Connect to S3 backend  
- Lock state using DynamoDB  
- Load modules  

---

## **4️⃣ Validate Configuration**

```bash
terraform validate
```

---

## **5️⃣ View Execution Plan**

```bash
terraform plan
```

This shows **what will be created**.

---

## **6️⃣ Apply the Infrastructure**

```bash
terraform apply -auto-approve
```

After completion, Terraform outputs:

- EC2 Public IP  
- VPC ID  
- S3 bucket name  

---

## **7️⃣ (Optional) Destroy Infrastructure**

```bash
terraform destroy -auto-approve
```

---

# 🤖 **GitHub Actions CI/CD (Auto Terraform)**

Whenever you **push to the main branch**, GitHub will automatically:

1. 🧹 Format Terraform code  
2. 🔍 Validate files  
3. 📝 Generate Terraform plan  
4. 🚀 Auto-apply changes (only on main branch)  

This allows **fully automated infrastructure deployments**.

---

# 📌 **Important Notes**

- Ensure your backend bucket and DynamoDB table exist before running `terraform init`.  
- Modify variable values in `terraform.tfvars` as per your environment.  
- You can create additional modules (RDS, ALB, Lambda) anytime.  

---

# 🎯 **Outcome**

By completing this project, you will learn:

- How to build cloud infrastructure using Terraform  
- How to design reusable Terraform modules  
- How to manage remote state properly  
- How to automate deployments using GitHub Actions  
- How to implement real-world DevOps workflows  

---

# 🧑‍💻 **Author**

**Aditya Jadhav**  
Beginner Cloud & DevOps Engineer  
GitHub: https://github.com/AdiJadhav1608  
Email: adijadhav8446@gmail.com  

---

If you want, I can also generate:  
✅ Architecture diagram  
✅ Project explanation for resume  
✅ YouTube video script  
✅ Blog article for your GitHub  

Just tell me! 🚀
