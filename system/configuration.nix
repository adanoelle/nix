{pkgs, ...}: {
  imports = [];

  environment.systemPackages = with pkgs; [
    awscli2
    # devenv
    comma
    fastfetch
    helix
    hyfetch
    nodejs
    soundsource
    vim
  ];

  homebrew = {
    enable = true;
    # onActivation.cleanup = "uninstall";

    taps = ["azure/functions"];
    brews = [
      "cowsay"
      "azure-cli"
      "azure-functions-core-tools@4"
    ];
    casks = [];
  };

  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;

  fonts.packages = [
    pkgs.monaspace
  ];

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.ada = {
    name = "ada";
    home = "/Users/ada";
  };
}
