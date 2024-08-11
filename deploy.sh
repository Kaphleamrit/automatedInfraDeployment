#!/bin/bash

# Define the directories
TERRAFORM_DIR="terraform"
ANSIBLE_DIR="ansible"
WEBSITE_DIR="website"

# Step 1: Run Terraform
echo "Running Terraform..."
cd $TERRAFORM_DIR
terraform init
terraform apply -auto-approve

# Step 2: Get the public IP of the newly created instance
echo "Getting the public IP..."
PUBLIC_IP=$(terraform output -raw public_ip)

if [ -z "$PUBLIC_IP" ]; then
    echo "Failed to retrieve the public IP address from Terraform."
    exit 1
fi

echo "Public IP is: $PUBLIC_IP"

# Step 3: Add the IP to the Ansible hosts file
echo "Updating Ansible hosts file..."
ANSIBLE_HOSTS_FILE="../$ANSIBLE_DIR/hosts"
cat > $ANSIBLE_HOSTS_FILE << EOL
[webservers]
$PUBLIC_IP ansible_user=ec2-user ansible_ssh_private_key_file=../automatedInfraKey.pem
EOL

# Step 4: Run the Ansible playbook
echo "Running Ansible playbook..."
cd ../$ANSIBLE_DIR
ansible-playbook -i hosts install_nginx.yml

if [ $? -ne 0 ]; then
    echo "Ansible playbook failed."
    exit 1
fi

# Step 5: Output the link to access the website
echo "Deployment complete."
echo "You can access the website at: http://$PUBLIC_IP"

