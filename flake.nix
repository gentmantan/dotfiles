{
  description = "My NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { nix-flatpak, nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      exampleIso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
        ./configuration-livecd.nix
        ];
      };
    };
    nixosConfigurations.gaming = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration-gaming.nix
      ];
    };
    nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration-workstation.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tangy = import ./home-manager/home.nix;
        }
        nix-flatpak.nixosModules.nix-flatpak
        ./nix-flatpak.nix
        nixvim.nixosModules.nixvim
        ./nixvim.nix
      ];
    };
  };
}
