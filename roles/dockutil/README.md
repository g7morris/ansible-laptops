dockutil
=========

This Ansible role installs and configures `dockutil`.

From [https://github.com/kcrawford/dockutil](https://github.com/kcrawford/dockutil)

> dockutil is a command line utility for managing macOS dock items. It is currently written in Swift, compatible with macOS Big Sur through Sonoma and can Add, List, Move, Find, Remove Dock Items along with Applications, Folders, Stacks, URLs.

Requirements
------------

- Ansible 2.9+ (or compatible version)
- Supported Operating Systems:
  - macOS Sonoma

Role Variables
--------------

Dependencies
------------

Testing the Role
----------------

* Open up this project in a terminal and from the project root run the following: `ansible-playbook -i roles/dockutil/tests/inventory roles/dockutil/tests/test.yml --ask-become-pass`
  * enter your sudo password

* The test should run to completion without failure.

License
-------

MIT

Author Information
------------------

[g7morris](https://github.com/g7morris)
