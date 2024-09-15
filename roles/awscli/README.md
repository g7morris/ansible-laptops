awscli
=========

This Ansible role installs and configures the AWS Command Line Interface `awscli`.

From [https://aws.amazon.com/cli/](https://aws.amazon.com/cli/)

> The AWS Command Line Interface (AWS CLI) is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

Requirements
------------

- Ansible 2.9+ (or compatible version)
- Supported Operating Systems:
  - Debian-based (e.g., Ubuntu 24.04 LTS)
  - macOS Sonoma

Role Variables
--------------

Package names.

Dependencies
------------

Testing the Role
----------------

* Open up this project in a terminal and from the project root run the following: `ansible-playbook -i roles/awscli/tests/inventory roles/awscli/tests/test.yml --ask-become-pass`
  * enter your sudo password

* The test should run to completion without failure.

License
-------

MIT

Author Information
------------------

[g7morris](https://github.com/g7morris)
