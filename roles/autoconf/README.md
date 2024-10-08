autoconf
=========

This Ansible role installs and configures `autoconf`.

From [https://www.gnu.org/software/autoconf/](https://www.gnu.org/software/autoconf/)

> Autoconf is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages. These scripts can adapt the packages to many kinds of UNIX-like systems without manual user intervention. Autoconf creates a configuration script for a package from a template file that lists the operating system features that the package can use, in the form of M4 macro calls.

Requirements
------------

- Ansible 2.9+ (or compatible version)
- Supported Operating Systems:
  - Debian-based (e.g., Ubuntu 24.04 LTS)
  - macOS Sonoma

Role Variables
--------------

Dependencies
------------

From [https://www.gnu.org/software/autoconf/](https://www.gnu.org/software/autoconf/)

> Producing configuration scripts using Autoconf requires GNU M4. You should install GNU M4 (at least version 1.4.6, although 1.4.13 or later is recommended) before configuring Autoconf, so that Autoconf's configure script can find it. The configuration scripts produced by Autoconf are self-contained, so their users do not need to have Autoconf (or GNU M4).

* [GNU M4](https://www.gnu.org/software/m4/m4.html)

* MacOS - This dependency is installed and satisfied by installing the XCode Command Line Tools e.g. `xcode-select --install` or running [scripts/install_dependencies.sh](../../scripts/install_dependencies.sh)
* Linux - This dependency is installed and satisfied by install the [build-essential](../../roles/build-essential) role

Testing the Role
----------------

* Open up this project in a terminal and from the project root run the following: `ansible-playbook -i roles/autoconf/tests/inventory roles/autoconf/tests/test.yml --ask-become-pass`
  * enter your sudo password

* The test should run to completion without failure.

License
-------

MIT

Author Information
------------------

[g7morris](https://github.com/g7morris)
