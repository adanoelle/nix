{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [ alacritty ];

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      window.padding = {
        x = 5;
        y = 2;
      };

      terminal.shell = "${pkgs.zsh}/bin/zsh";

      general.working_directory = "/Users/ada/home";

      cursor.style = "Beam";

      # Catpuccin-macchiato
      # https://github.com/catppuccin/alacritty/blob/main/catppuccin-macchiato.toml
      colors = {
        primary = {
          background = "#24273A";
          foreground = "#CAD3F5";
          dim_foreground = "#CAD3F5";
          bright_foreground = "#CAD3F5";
        };

        normal = {
          black = "#494D64";
          red = "#ED8796";
          green = "#A6DA95";
          yellow = "#EED49F";
          blue = "#8AADF4";
          magenta = "#F5BDE6";
          cyan = "#8BD5CA";
          white = "#B8C0E0";
        };

        bright = {
          black = "#5B6078";
          red = "#ED8796";
          green = "#A6DA95";
          yellow = "#EED49F";
          blue = "#8AADF4";
          magenta = "#F5BDE6";
          cyan = "#8BD5CA";
          white = "#A5ADCB";
        };

        dim = {
          black = "#494D64";
          red = "#ED8796";
          green = "#A6DA95";
          yellow = "#EED49F";
          blue = "#8AADF4";
          magenta = "#F5BDE6";
          cyan = "#8BD5CA";
          white = "#B8C0E0";
        };

        footer_bar = {
          foreground = "#24273A";
          background = "#A5ADCB";
        };

        selection = {
          text = "#24273A";
          background = "#F4DBD6";
        };

        cursor = {
          text = "#24273A";
          cursor = "#F4DBD6";
        };

        vi_mode_cursor = {
          text = "#1E1E2E";
          cursor = "#B4BEFE";
        };
      };

      keyboard.bindings = [ 
        {
          key = "Key0";
          mods = "Control";
          action = "ResetFontSize";
        }
        {
          # When using the japanese keyboard, the key to the
          # right of the Minus key is Key6
          key = "ArrowUp"; 
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
      ];
    };
  };
}
