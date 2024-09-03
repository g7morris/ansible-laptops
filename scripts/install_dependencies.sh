#!/bin/bash

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
    brew install git python3 ansible
    echo "Git, Python3, and Ansible installed successfully."
}

# Install dependencies on Ubuntu
install_ubuntu() {
    echo "Detected Ubuntu. Installing dependencies..."

    # Update the package list
    sudo apt update

    # Install Git, Python3, and Ansible
    sudo apt install -y git python3 python3-pip software-properties-common

    # Add Ansible PPA and install Ansible
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible

    echo "Git, Python3, and Ansible installed successfully."
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