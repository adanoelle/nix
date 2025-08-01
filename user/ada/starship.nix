{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [starship];

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      line_break.disabled = false;
      character = {
        success_symbol = "[➜](bold green)";
      };
      os = {
        format = "$symbol";
        style = "bold blue";
        disabled = false;
      };
      os.symbols = {
        NixOS = "❄️ ";
      };

      # Show the Nix shell name (`$name`) after the Nix logo
      nix_shell = {
        symbol = " ";
        format = "via [$symbol$state]($style) [$name]($style) ";
        style  = "bold yellow"
      };
    };
  };
}
