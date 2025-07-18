{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.yggdrasil = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.nvf.nixosModules.default
        inputs.home-manager.nixosModules.default
        hosts/yggdrasil/configuration.nix
      ];
    };

    nixosConfigurations.midgard = nixpkgs.lib.nixosSystem {
      modules = [
        inputs.nvf.nixosModules.default
        inputs.home-manager.nixosModules.default
        hosts/midgard/configuration.nix
      ];
    };
  };
}
