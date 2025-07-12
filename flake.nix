{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: {
    nixosConfigurations.yggdrasil = nixpkgs.lib.nixosSystem {
      modules = [
        nvf.nixosModules.default
        yggdrasil/configuration.nix
      ];
    };

    nixosConfigurations.midgard = nixpkgs.lib.nixosSystem {
      modules = [
        nvf.nixosModules.default
        midgard/configuration.nix
      ];
    };
  };
}
