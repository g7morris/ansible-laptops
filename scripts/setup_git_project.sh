#!/bin/bash

# Prompt for the Ansible git project name
# e.g. ansible-laptops
read -p "Enter the new project name: " project_name

# Prompt for the Ansible git project directory location
read -p "Enter the directory where the new project should be created (default is this directory, hit enter to proceed): " project_dir

# Set project directory to current if not provided
project_dir=${project_dir:-$(pwd)}

# Create the Ansible project directory
echo "Creating the Ansible project directory..."
mkdir -p "$project_dir/$project_name"
cd "$project_dir/$project_name"

# Initialize a Git Repository
echo "Initializing this directory as a git repository..."
git init

# Create the Ansible project structure with the directories for roles,
# inventories, playbooks, variables, templates, files, and handlers etc.
echo "Creating the Ansible project structure..."
mkdir -p inventory
mkdir -p group_vars
mkdir -p host_vars
mkdir -p playbooks
mkdir -p templates
mkdir -p files
mkdir -p handlers

# Initialize Roles using ansible-galaxy
echo "Initializing three example roles using ansible-galaxy, edit and refine as needed"
ansible-galaxy init roles/role1
ansible-galaxy init roles/role2
ansible-galaxy init roles/role3

# Create a playbook
echo "Creating a playbook at playbooks/setup.yml..."
touch playbooks/setup.yml

# Create an inventory file
echo "Creating an inventory file at inventory/hosts.yml..."
touch inventory/hosts.yml

# Create group_vars and host_vars files
echo "Creating group_vars and host_vars files..."
touch group_vars/all.yml
touch host_vars/localhost.yml

# Create the scripts directory and move the setup script into it
echo "Creating scripts directory and moving the setup script..."
mkdir -p scripts
mv ../setup_git_project.sh scripts/

# Script completed
echo "Script completed. Your Ansible project is set up in $project_dir/$project_name"
