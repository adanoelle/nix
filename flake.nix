{
  description = "Ada's Bubblebum";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, home-manager, darwin, rust-overlay, nix-homebrew, homebrew-core, homebrew-cask, nixpkgs }: {
    darwinConfigurations = {
      bubblegum = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ 
          ./system/configuration.nix
          home-manager.darwinModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ada = import ./user/ada/home.nix;
          }
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
          })
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."bubblegum".pkgs;
    };
  };
}
