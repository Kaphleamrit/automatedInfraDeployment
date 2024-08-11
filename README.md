
<h1 align="center" style="font-family: 'Arial', sans-serif; color: #2C3E50;">
  Automated Infrastructure Deployment
</h1>

<p align="center" style="font-size: 1.2em; color: #34495E;">
  <strong>An elegant solution to automate infrastructure setup, configuration, and web deployment using Terraform and Ansible.</strong>
</p>

---

## 🚀 Project Overview

This project automates the provisioning and configuration of infrastructure using **Terraform** and **Ansible**. Once the infrastructure is provisioned, it automatically deploys a simple web server with Nginx, serving a custom HTML file.

### 📂 Project Structure

```bash
AUTOMATEDINFRA/
├── ansible/                # Ansible playbooks and inventory
│   ├── hosts               # Ansible inventory file
│   └── install_nginx.yml   # Playbook to install and configure Nginx
├── jenkins/                # Jenkins pipelines (future use)
├── terraform/              # Terraform configuration files
│   ├── main.tf             # Main Terraform configuration file
│   └── variables.tf        # Variables used in Terraform
├── website/                # Website content
│   └── index.html          # HTML file served by Nginx
├── automatedInfraKey.pem   # SSH private key for accessing the instance
├── deploy.sh               # Bash script to automate the entire process
└── README.md               # This fancy README file
```

---

## 🛠️ Tools and Technologies

- **Terraform**: Infrastructure as Code (IaC) tool used to provision the infrastructure.
- **Ansible**: Configuration management tool used to install and configure the Nginx web server.
- **Nginx**: Web server that hosts the website.
- **Bash**: Scripting language used to automate the workflow.

---

## 🌟 Features

- **Automated Provisioning**: Spin up an AWS EC2 instance with Terraform.
- **Seamless Configuration**: Install and configure Nginx with Ansible.
- **Dynamic Inventory Management**: Automatically update the Ansible inventory with the new instance's IP.
- **Automated Deployment**: Deploy your website with a single command.
- **Accessible Web Interface**: Get the direct link to access your website after deployment.

---

## 🚀 Quick Start

Follow these steps to get your infrastructure and website up and running:

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/automated-infra.git
cd automated-infra
```

### 2. Configure Your Environment

Ensure you have the following installed:

- Terraform
- Ansible
- Bash
- AWS CLI (configured with your credentials)

### 3. Run the Deployment Script

```bash
chmod +x deploy.sh
./deploy.sh
```

This script will:

1. Initialize and apply the Terraform configuration.
2. Retrieve the public IP of the newly created instance.
3. Update the Ansible inventory file with the instance's IP.
4. Run the Ansible playbook to install Nginx and deploy the website.
5. Output the URL where your website can be accessed.

### 4. Access Your Website

After the script completes, you'll receive a link to access your deployed website. Simply open it in your web browser.

---

## 📚 Further Reading

- [Terraform Documentation](https://www.terraform.io/docs/)
- [Ansible Documentation](https://docs.ansible.com/)
- [Nginx Documentation](https://nginx.org/en/docs/)

---

<h3 align="center" style="font-family: 'Arial', sans-serif; color: #2C3E50;">
  Made with 💻 & ☕ by Amrit Kafle
</h3>
