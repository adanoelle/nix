{ config, pkgs, ... }:

{
  # Declare the primary user for user‑scoped options (homebrew.enable, fonts, etc.)
  system.primaryUser = "ada";

  environment.systemPackages = [
    pkgs.awscli2
    pkgs.devenv      # now coming from nixpkgs-unstable because the flake uses unstable
    pkgs.direnv
    pkgs.comma
    pkgs.fastfetch
    pkgs.helix
    pkgs.hyfetch
    pkgs.nodejs
    pkgs.soundsource
    pkgs.vim
  ];

  homebrew = {
    enable = true;
    # Make sure the cask repository is tapped and the Azure tap remains
    taps = [
      "azure/functions"
    ];

    # Install your existing CLI tools
    brews = [
      "cowsay"
      "azure-cli"
      "azure-functions-core-tools@4"
    ];

    # Install Ghostty via Homebrew’s cask
    casks = [
      "ghostty"
    ];

    # Ask nix‑darwin to run `brew update` before installing/upgrading
    onActivation = {
      autoUpdate = true;  # fetch latest cask definitions
      # You can also set upgrade and cleanup here if desired
      upgrade = true;    # upgrade outdated packages on activation
      cleanup = "zap";   # remove unlisted packages
    };
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
    trusted-users = [ "root" "ada" ];
  };

  programs.zsh.enable = true;
  fonts.packages = [ pkgs.monaspace ];

  # Keep other options (system.stateVersion, hostPlatform, users.users.ada, etc.)
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.ada = {
    name = "ada";
    home = "/Users/ada";
  };
}

