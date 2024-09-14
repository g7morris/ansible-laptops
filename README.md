# Ansible Laptops

## Overview

This repository automates the installation and configuration of software on both macOS Sonoma and Ubuntu Linux laptops. Utilizing a combination of bash scripts and Ansible playbooks ensures that one's development environment is consistently configured across different operating systems.

All syntax, formatting etc is critiqued by the following in a Github Actions workflow:
* [ansible-lint](https://github.com/ansible/ansible-lint) - checks playbooks for practices and behavior that could potentially be improved
* [yamllint](https://github.com/adrienverge/yamllint) - A linter for YAML files.

## How to Use This Repository

### 1. Clone the Repository

First, clone this repository to your local machine or to a USB stick to then copy depending on your setup.

```bash
git clone https://github.com/g7morris/ansible-laptops.git
cd ansible-laptops
```

#### Setting Up Pre-Commit Hooks for Ansible Checks

* Ensure that the Ansible playbooks are free of syntax errors and follow best practices before committing changes by setting up a pre-commit hook.
  * Create a script named pre-commit in the .git/hooks directory of your repository.

```bash
#!/bin/bash

# Run Ansible syntax check
echo "Running Ansible syntax check..."
ansible-playbook --syntax-check roles/**/*.yml
if [ $? -ne 0 ]; then
  echo "Ansible syntax check failed. Aborting commit."
  exit 1
fi

# Run Ansible linter
echo "Running Ansible linter..."
ansible-lint roles/**/*.yml
if [ $? -ne 0 ]; then
  echo "Ansible linting failed. Aborting commit."
  exit 1
fi

echo "All checks passed. Proceeding with commit."
exit 0
```

* Make the script executable by running:
  * `chmod +x .git/hooks/pre-commit`

* `pip install ansible-lint` - If you haven't already

 * Try to commit changes to your repository. The pre-commit hook will run the Ansible syntax check and linter before allowing the commit.


### 2. Run the Dependency Installation Script

Before you can run the Ansible playbooks, you need to ensure that all necessary dependencies are installed on your system. This script will detect your operating system (macOS or Ubuntu) and install the required dependencies, such as Homebrew on macOS or APT packages on Ubuntu.

Use the provided [install_dependencies.sh](scripts/install_dependencies.sh) script:

```bash
chmod +x scripts/install_dependencies.sh
./scripts/install_dependencies.sh
```

### 3. Install the required Ansible roles

```bash
ansible-galaxy install -r requirements.yml --role-path ./roles/
```

### 4. Run the Ansible Playbook

After installing the dependencies, you can run the Ansible playbook to set up your laptop:

```bash
ansible-playbook playbooks/setup.yml
```

This playbook will apply the appropriate roles to your system based on whether you’re using macOS or Ubuntu.

---

### List of Installed Software

For a detailed list of all the software installed by this repository, please refer to the [software_meta_README.md](docs/software_meta_README.md).

---

### Contributing

If you would like to contribute to this project, please feel free to fork the repository and submit a pull request with your improvements or suggestions.

---

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
