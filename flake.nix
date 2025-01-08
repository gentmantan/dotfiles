{
  description = "My NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    microvm.url = "github:astro/microvm.nix";
    microvm.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nix-flatpak, nixpkgs, home-manager, nixvim, microvm, ... }: {
    nixosConfigurations = {
      my-iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
        ./hosts/livecd/configuration-livecd.nix
        ];
      };
    };
    nixosConfigurations.gaming = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/gaming/configuration-gaming.nix
      ];
    };
    nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/workstation/configuration-workstation.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tangy = import ./modules/home-manager/home.nix;
        }
        nix-flatpak.nixosModules.nix-flatpak
        ./modules/nix-flatpak.nix
        nixvim.nixosModules.nixvim
        ./modules/nixvim.nix
      ];
    };
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        microvm.nixosModules.host
        ./hosts/server/configuration-server.nix
        ./modules/nixos-containers/default.nix
      ];
    };
  };
}
