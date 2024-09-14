#!/bin/zsh

# Detect the operating system
OS=$(uname -s)

# Install Xcode Command Line Tools on macOS
install_xcode_clt() {
    echo "Checking for Xcode Command Line Tools..."

    if ! xcode-select --print-path &> /dev/null; then
        echo "Xcode Command Line Tools not found. Installing..."

        # This command installs the tools and requires user interaction
        xcode-select --install

        # Wait until the installation is complete
        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done

        # Check if the OS is macOS before running softwareupdate
        if [[ "$(uname)" == "Darwin" ]]; then
            softwareupdate -i -a --verbose
        fi

        echo "Xcode Command Line Tools installed successfully."
    else
        echo "Xcode Command Line Tools are already installed."
    fi
}

# Install dependencies on macOS
install_macos() {
    echo "Detected macOS. Installing dependencies..."

    # Install Xcode Command Line Tools
    install_xcode_clt

    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew installed successfully."

        # Add Homebrew to PATH for current and future shell sessions
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo "Homebrew added to PATH."
    else
        echo "Homebrew is already installed."
    fi

    # Install Git, Python3, and Ansible
    brew install git python3 ansible pipx
    echo "Git, Python3, Pipx and Ansible installed successfully."

    # Add pre-commit using pipx to avoid conflicts
    pipx install pre-commit
    pipx ensurepath

    # Add pipx binary directory to PATH in .zshrc if not already present
    if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.zshrc"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
    fi

    # Source the .zshrc file to ensure PATH is updated
    if [ -f "/home/$(whoami)/.zshrc" ]; then
        source "/home/$(whoami)/.zshrc"
    fi

    # Verify if pre-commit is in PATH
    if ! command -v pre-commit &> /dev/null; then
        echo "pre-commit is not in the PATH after installation. Please check your shell configuration."
        exit 1
    fi
    echo "pre-commit installed successfully."

    # Add ansible-dev-tools which includes ansible-lint for pre-commit linting using pipx to avoid conflicts
    pipx install ansible-dev-tools
    pipx ensurepath

    # Add ansible-dev-tools binary directory to PATH in .zshrc if not already present
    if ! grep -q 'export PATH="$HOME/.local/pipx/venvs/ansible-dev-tools/bin:$PATH"' "$HOME/.zshrc"; then
        echo 'export PATH="$HOME/.local/pipx/venvs/ansible-dev-tools/bin:$PATH"' >> "$HOME/.zshrc"
    fi

    # Source the .zshrc file to ensure PATH is updated
    if [ -f "/Users/$(whoami)/.zshrc" ]; then
        source "/Users/$(whoami)/.zshrc"
    fi

    # Verify if ansible-lint is in PATH
    if ! command -v ansible-lint &> /dev/null; then
        echo "ansible-lint is not in the PATH after installation. Please check your shell configuration."
        exit 1
    fi
    echo "Verified ansible-dev-tools installed successfully."

    # Ensure Git is installed
    if ! command -v git &> /dev/null; then
        echo "Git is not installed. Please install Git and try again."
        exit 1
    fi

    # Ensure the script is run in a Git repository
    if ! git rev-parse --is-inside-work-tree &> /dev/null; then
        echo "This script must be run within a Git repository."
        exit 1
    fi

    # Install the pre-commit hooks
    cd ../ && pre-commit install --config ../.pre-commit-config.yaml
    if [ $? -eq 0 ]; then
        echo "Verified pre-commit hooks installed successfully."
    else
        echo "Failed to install pre-commit hooks. Check the log at /Users/$(whoami)/.cache/pre-commit/pre-commit.log"
    exit 1
    fi
}

# Install dependencies on Ubuntu
install_ubuntu() {
    echo "Detected Ubuntu. Installing dependencies..."

    # Update the package list
    sudo apt update

    # Install Git, Python3, and Ansible
    sudo apt install -y ca-certificates git python3 python3-pip software-properties-common pipx
    echo "Git, Python3, Pipx and additional dependencies installed successfully."

    # Add Ansible PPA and install Ansible
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    echo "Ansible installed successfully."

    # Add pre-commit using pipx to avoid conflicts
    pipx install pre-commit
    pipx ensurepath

    # Add pipx binary directory to PATH in .zshrc if not already present
    if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.zshrc"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
    fi

    # Source the .zshrc file to ensure PATH is updated
    if [ -f "/home/$(whoami)/.zshrc" ]; then
        source "/home/$(whoami)/.zshrc"
    fi

    # Verify if pre-commit is in PATH
    if ! command -v pre-commit &> /dev/null; then
        echo "pre-commit is not in the PATH after installation. Please check your shell configuration."
        exit 1
    fi
    echo "pre-commit installed successfully."

    # Add ansible-dev-tools which includes ansible-lint for pre-commit linting using pipx to avoid conflicts
    pipx install ansible-dev-tools
    pipx ensurepath

    # Add ansible-dev-tools binary directory to PATH in .zshrc if not already present
    if ! grep -q 'export PATH="$HOME/.local/pipx/venvs/ansible-dev-tools/bin:$PATH"' "$HOME/.zshrc"; then
        echo 'export PATH="$HOME/.local/pipx/venvs/ansible-dev-tools/bin:$PATH"' >> "$HOME/.zshrc"
    fi

    # Source the .zshrc file to ensure PATH is updated
    if [ -f "/Users/$(whoami)/.zshrc" ]; then
        source "/Users/$(whoami)/.zshrc"
    fi

    # Verify if ansible-lint is in PATH
    if ! command -v ansible-lint &> /dev/null; then
        echo "ansible-lint is not in the PATH after installation. Please check your shell configuration."
        exit 1
    fi
    echo "Verified ansible-dev-tools installed successfully."

    # Install the pre-commit hooks
    pre-commit install --config ../.pre-commit-config.yaml
    echo "Verified pre-commit hooks installed successfully."
}

# Install dependencies based on detected OS
case "$OS" in
    Darwin)
        install_macos
        ;;
    Linux)
        # Check if it's Ubuntu
        if [ -f /etc/lsb-release ] && grep -q "Ubuntu" /etc/lsb-release; then
            install_ubuntu
        else
            echo "Unsupported Linux distribution. Exiting..."
            exit 1
        fi
        ;;
    *)
        echo "Unsupported OS. Exiting..."
        exit 1
        ;;
esac

echo "Ansible and dependencies installed successfully!"
