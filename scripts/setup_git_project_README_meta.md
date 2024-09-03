# Project Setup Script (Optional)

## Overview

The `setup_git_project.sh` script is used to initialize a fresh Ansible project structure. It is intended for one-time use by the repository owner or by contributors who want to understand and build the project from scratch instead of using the ansible-laptops-setup project.

## Usage

Run this script if you are setting up the project for the first time. It creates the necessary directory structure, initializes roles using Ansible Galaxy, and prepares the project for further development.

## Project Structure Created

- **inventory/hosts.yml**: Defines the hosts or groups of hosts.
- **group_vars/all.yml**: Variables for all hosts.
- **host_vars/localhost.yml**: Variables for the localhost.
- **roles/common**: Common tasks for both macOS and Ubuntu.
- **roles/macos-specific**: Tasks specific to macOS.
- **roles/ubuntu-specific**: Tasks specific to Ubuntu.
- **playbooks/laptop-setup.yml**: Main playbook that orchestrates the roles.

---

## Run this script

* Copy the `scripts/setup_git_project.sh` file to a new location to create a blank git repo and Ansible project directory with a name of your choice.

* Open up a terminal to the new location and run `./setup_git_project.sh`
  * It is an interactive script with prompts. 

* Once named the script will proceed to create the following:
  1.	`files/`: Directory for static files that you might want to copy to the target systems.
	2.	`group_vars/`: Contains all.yml, which can hold variables that apply to all hosts in the inventory.
	3.	`handlers/`: A place for handler tasks that get triggered by other tasks, such as restarting services.
	4.	`host_vars/`: Contains localhost.yml, which can hold variables specific to the localhost host.
	5.	`inventory/`: Contains hosts.yml, where you define the hosts or groups of hosts to which the playbooks will be applied.
	6.	`playbooks/`: Contains setup.yml, the main playbook that will orchestrate the roles.
	7.	`roles/`: Contains the roles shared, macos-only, and ubuntu-only, each with its own complete structure (tasks, handlers, vars, templates, etc.). Feel free to change to whatever you need using the `ansible-galaxy init roles/your_role_here` command to save time and effort.
	8.	`scripts/:` In general contains additional scripts for meta-tasks and now with the `setup_git_project.sh` as your first.
	9.	`templates/`: Directory for Jinja2 templates that can be used in tasks.

---

## Development next steps

1. Define tasks in your roles in `roles/common/tasks/main.yml`, `roles/macos-specific/tasks/main.yml`, and `roles/ubuntu-specific/tasks/main.yml`.
2. Customize the playbook in `playbooks/laptop-setup.yml`.
3. Run the playbook using `ansible-playbook playbooks/laptop-setup.yml`.
4. Test as needed and push changes to your new git repo. Enjoy.

## Important Notes

This script is optional and is meant for users who want to understand the setup process. 

It is not necessary to run this script if the project has already been initialized or cloned. 