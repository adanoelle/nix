{ config, lib, pkgs, ... }: let 

in {
  imports = [
    ./alacritty.nix
    ./fzf.nix
    ./helix.nix
    ./hyfetch.nix
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
    deno
    gcc
    hyfetch
    libiconv
    micromamba
    nerdfonts
    nodePackages.typescript
    nodejs
    fastfetch
    font-awesome
    google-fonts
    raycast
    terraform
    tree
    uv
    vscode
    zld
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
