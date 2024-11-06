{ config, lib, pkgs, ... }: let 

in {
  imports = [
    ./alacritty.nix
    ./fzf.nix
    ./helix.nix
    ./nushell.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  #home.username = "ada";
  #home.homeDirectory = "/Users/ada";

  home.packages = with pkgs; [
    aerospace
    bat
    bottom
    gcc
    nerdfonts
    font-awesome
    google-fonts
    raycast
    tree
    uv
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
