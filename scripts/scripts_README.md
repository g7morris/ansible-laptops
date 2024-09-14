# Scripts README

* [install_dependencies.sh](../scripts/install_dependencies.sh) - Installs the preliminary software listed below necessary for running Ansible on either OS.
  * macOs
    * ansible
    * [ansible-dev-tools](https://ansible.readthedocs.io/projects/dev-tools/)
      * [ansible-lint](https://ansible.readthedocs.io/projects/lint/)
    * git
    * homebrew
    * [pipx](https://github.com/pypa/pipx)
    * python3
    * python3-pip
    * Xcode Command Line Tools
  * Ubuntu
    * ansible
    * [ansible-dev-tools](https://ansible.readthedocs.io/projects/dev-tools/)
      * [ansible-lint](https://ansible.readthedocs.io/projects/lint/)
    * ca-certificates
    * git
    * [pipx](https://github.com/pypa/pipx)
    * python3
    * python3-pip
    * software-properties-common

* [setup_git_project.sh](../scripts/setup_git_project.sh) - Optional script for those who want to start from scratch and reconstruct this project.
  * Please read [docs/setup_git_project_README_meta.md](../docs/setup_git_project_README_meta.md) for more information and how to use.
