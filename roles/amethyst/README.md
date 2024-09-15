amethyst
=========

This Ansible role installs and configures the Tiling window manager for macOS `amethyst`.

* [https://github.com/ianyh/Amethyst](https://github.com/ianyh/Amethyst)

* `brew info --cask amethyst` - Find out more information

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

* Open up this project in a terminal and from the project root run the following: `ansible-playbook -i roles/amethyst/tests/inventory roles/amethyst/tests/test.yml --ask-become-pass`
  * enter your sudo password
* The test should run to completion without failure.
```

License
-------

MIT

Author Information
------------------

[g7morris](https://github.com/g7morris)
