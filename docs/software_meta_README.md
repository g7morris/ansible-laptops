# Software Installed by Ansible Laptops

This document provides a comprehensive list of all the software that gets installed by the Ansible playbook in this repository. The software is categorized based on whether it's installed on macOS, Ubuntu, or both.

- **Customization**: If you need to customize the list of software, you can edit the respective role files in the `roles` directory.

- **Dependencies**: Some software requires other dependencies that are automatically managed by the playbook.

For more details on the tasks involved in installing this software, please refer to the respective role files in the `roles` directory.

In some cases, I've differed to using community maintained and defined Ansible Galaxy roles rather than rolling my own. Please review the [requirements.yml] file for this.

---

## Shared / common software (_Installed on both macOS and Ubuntu_)

- Ansible
- AWS CLI
- Git
- Google Chrome
- Oh My Zsh (with Powerline font)
- Python3
- Signal
- Terraform
- Visual Studio Code with extensions / plugins
  - github.copilot
  - github.copilot-chat
  - ms-azuretools.vscode-docker
  - ms-vscode-remote.remote-containers
  - ms-vscode-remote.vscode-remote-extensionpack
  - ms-vscode.remote-server
  - shd101wyy.markdown-preview-enhanced
  - tomoki1207.pdf
  - ue.alphabetical-sorter
  - yzane.markdown-pdf
  - yzhang.markdown-all-in-one
- VLC Media Player
- Zsh

## macOS-Specific Software

- Amethyst (_window manager_)
- Docker for Mac
- Homebrew
- iTerm2

## Ubuntu-Specific Software
