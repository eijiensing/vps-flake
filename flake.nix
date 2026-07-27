{
  description = "Netcup vps flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

# Disko
disko.url = "github:nix-community/disko";

    # Neovim
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay?rev=1e7087c03f0fb1935f73bd28ba044714cfab34f4";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        netcup = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/netcup/configuration.nix
            self.nixosModules
	inputs.disko.nixosModules.disko
          ];
        };
      };

      homeConfigurations = {
        "eiji@netcup" = home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
            hostname = "netcup";
          };
          modules = [
            ./hosts/netcup/home.nix
          ];
        };
      };
    };
}
