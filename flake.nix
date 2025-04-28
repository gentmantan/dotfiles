{
  description = "My NixOS configurations";

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
    microvm.inputs.nixpkgs.follows = "nixpkgs";
    microvm.url = "github:astro/microvm.nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nix-flatpak, nixpkgs, home-manager, nixvim, microvm, lanzaboote, ... }: {
    nixosConfigurations = {
      my-iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
        ./hosts/livecd/configuration-livecd.nix
        ];
      };
      gaming = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/gaming/configuration-gaming.nix
        ];
      };
      workstation = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/workstation/configuration-workstation.nix
          lanzaboote.nixosModules.lanzaboote
          ./modules/lanzaboote.nix
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
      server = nixpkgs.lib.nixosSystem {
        modules = [
          microvm.nixosModules.host
          ./modules/microvm/barge.nix
          ./modules/microvm/ferry.nix
          ./hosts/server/configuration-server.nix
        ];
      };
    };
  };
}
