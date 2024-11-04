{ config, lib, pkgs, ... }: let 

in {
  imports = [
    ./alacritty.nix
    ./helix.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  #home.username = "ada";
  #home.homeDirectory = "/Users/ada";

  home.packages = with pkgs; [
    bat
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
