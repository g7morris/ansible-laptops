# Software Installed by Ansible Laptops

This document provides a comprehensive list of all the software that gets installed by the Ansible playbook in this repository. The software is categorized based on whether it's installed on macOS, Ubuntu, or both.

* **Customization**: If you need to customize the list of software, you can edit the respective role files in the `roles` directory.

* **Dependencies**: Some software requires other dependencies that are automatically managed by the playbook.

For more details on the tasks involved in installing this software, please refer to the respective role files in the `roles` directory.

In some cases, I may have deferred to using community maintained and defined Ansible Galaxy roles rather than rolling my own. Please review the [requirements.yml](../collections/requirements.yml) file for this.

Lastly, feel free to click on the links below for explanations or more information about the software used prior to installing.

---

## Shared software
_Installed on both macOS and Ubuntu_

* [Ansible](https://ansible.readthedocs.io/en/latest/) - (_installed by the [install_dependencies.sh](../scripts/install_dependencies.sh) script_)
  * [ansible-lint](https://github.com/ansible/ansible-lint)
* [autoconf](https://www.gnu.org/software/autoconf/)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Docker compose](https://docs.docker.com/compose/)
* [Firefox](https://www.mozilla.org/en-US/firefox/)
* [Git](https://git-scm.com/)
* [go](https://go.dev/)
* [Google Chrome](https://www.google.com/chrome/)
* [gpg](https://gnupg.org/)
* [iperf](https://iperf.fr/)
* [nmap](https://nmap.org/)
* [Oh My Zsh](https://ohmyz.sh/)
  * [Powerlevel10k font & theme](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0)
* [pv](https://formulae.brew.sh/formula/pv)
* Python3
  * [pyYAML](https://pypi.org/project/PyYAML/)
* [Signal](https://signal.org/)
* [sqlite](https://www.sqlite.org/)
* [Terraform](https://www.terraform.io/)
* [Visual Studio Code](https://code.visualstudio.com/) _with extensions & plugins_
  * github.copilot
  * github.copilot-chat
  * ms-azuretools.vscode-docker
  * ms-vscode-remote.remote-containers
  * ms-vscode-remote.vscode-remote-extensionpack
  * ms-vscode.remote-server
  * shd101wyy.markdown-preview-enhanced
  * tomoki1207.pdf
  * ue.alphabetical-sorter
  * yzane.markdown-pdf
  * yzhang.markdown-all-in-one
* [VLC](https://www.videolan.org/vlc/)
* [wget](https://www.gnu.org/software/wget/)
* [yamllint](https://github.com/adrienverge/yamllint)
* [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)

## macOS Specific Software
_Installed only on macOS_

* [Amethyst](https://github.com/ianyh/Amethyst) (_window manager_)
* [Docker for Mac](https://docs.docker.com/desktop/install/mac-install/) (_Docker_)
* [dockutil](https://github.com/geerlingguy/ansible-collection-mac/tree/master/roles/dock)
  * _Using geerlingguy Ansible module_
* [Handbrake](https://handbrake.fr/)
* [Homebrew](https://brew.sh/)
* [iTerm2](https://iterm2.com/)
* [Xcode Command Line Tools](https://mac.install.guide/commandlinetools/) - _tools for software developers that run on the command line, in the Terminal application._

## Ubuntu Specific Software
_Installed only on Ubuntu_

* [build-essential](https://medium.com/@adwalkz/demystifying-development-a-guide-to-build-essential-in-ubuntu-for-seamless-software-compilation-b590b5a298bb)
* [Docker](https://docs.docker.com/engine/install/ubuntu/)
* [System76 Pop-OS Pop Shell](https://github.com/pop-os/shell?tab=readme-ov-file#installation)
* [zsh](https://www.zsh.org/) (_default shell on macOS_)
