{ config, pkgs, ... }:

{
  programs.brew = {
    enable = true;        # Enable the Brew module
    install = true;       # Install Homebrew if not already installed

    # Specify Homebrew packages to install
    packages = with pkgs; [
      wget
      git
      # Add other packages as needed
    ];

    # Specify Homebrew cask applications to install
    caskPackages = with pkgs; [
      google-chrome
      visual-studio-code
      # Add other cask applications as needed
    ];

    # Enable Rosetta support for Intel-based Homebrew if on Apple Silicon
    enableRosetta = true;
  };
}

