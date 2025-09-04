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
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nix-flatpak,
    nixpkgs,
    home-manager,
    nvf,
    microvm,
    lanzaboote,
    ...
  }: {
    packages.x86_64-linux.neovim =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./modules/nvf.nix];
      }).neovim;

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
          ({pkgs, ...}: {
            environment.systemPackages = [self.packages.${pkgs.stdenv.system}.neovim];
          })
        ];
      };
      work-server = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/work-server/configuration-work-server.nix
        ];
      };
      server = nixpkgs.lib.nixosSystem {
        modules = [
          microvm.nixosModules.host
          ./modules/microvm/barge.nix
          ./modules/microvm/ferry.nix
          ./modules/microvm/cryptpad.nix
          ./hosts/server/configuration-server.nix
        ];
      };
    };
  };
}
