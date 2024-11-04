{ config, lib, pkgs, ... }: let 

in {
  imports = [
    ./alacritty.nix
    ./helix.nix
    ./starship.nix
    ./zsh.nix
  ];

  #home.username = "ada";
  #home.homeDirectory = "/Users/ada";

  home.packages = with pkgs; [
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
