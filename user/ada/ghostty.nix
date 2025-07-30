{ config, pkgs, ...}:
{
  programs.ghostty = {
    enable  = true;
    package = null;               # use the Homebrew installation
    settings = {
      font-family = "FiraCode Nerd Font";  # match the installed font
      font-size   = 11;
      # add other Ghostty settings here, e.g. theme, opacity, etc.
    };
  };
}
