{
  description = "Ada's Bubblegum";

  inputs = {
    # Everything comes from the unstable channel now
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager,
              nix-index-database, rust-overlay, ... }: {
    darwinConfigurations.bubblegum = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./system/configuration.nix
        nix-index-database.darwinModules.nix-index
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ada = import ./user/ada/home.nix;
        }
        # rust overlay
        ({ pkgs, ... }: {
          nixpkgs.overlays = [ rust-overlay.overlays.default ];
          environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
        })
      ];
    };

    darwinPackages = self.darwinConfigurations."bubblegum".pkgs;
  };
}

