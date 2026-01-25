# ❄️ My NixOS Dotfiles ❄️

_'A desktop of beauty is a joy forever 🔥' edition_

[![Flake check](https://github.com/gentmantan/dotfiles/actions/workflows/test.yml/badge.svg)](https://github.com/gentmantan/dotfiles/actions/workflows/test.yml)
[![Flake update](https://github.com/gentmantan/dotfiles/actions/workflows/update.yml/badge.svg)](https://github.com/gentmantan/dotfiles/actions/workflows/update.yml)

## Screenshots

![Screenshot of workstation desktop](screenshot.png)

## Overview

This repository contains my NixOS configuration files. It includes separate
flake references for several systems:

- 💻 The [#workstation](./hosts/workstation/configuration-workstation.nix)
  configuration is interesting because it uses
  [flatpak sandboxing](./modules/nix-flatpak.nix) to isolate user applications,
  as well as [niri](https://github.com/YaLTeR/niri) for window management and
  [nvf](https://github.com/NotAShelf/nvf) for text editing.
- ☁️ The [#server](./hosts/server/configuration-server.nix) configuration sets
  up a host that runs web services using
  [podman](https://github.com/containers/podman) and
  [microvm](https://github.com/microvm-nix/microvm.nix) with support for remote
  unlocking and automatic OS/container upgrades.
- 💿 The [#livecd](./hosts/server/configuration-server.nix) configuration
  creates a custom ISO with some of my favorite recovery tools, as well as an
  OpenSSH server. Build it by running
  `nix build .#nixosConfigurations.my-iso.config.system.build.isoImage`.

You can also try out my 📝 [neovim configuration](./modules/nvf.nix)
independently, which includes LSPs for several languages as well as helpful Git
and navigation plugins, among other things. Simply run the following line on
your own system: `nix run github:gentmantan/dotfiles#neovim`

## Installation

> [!WARNING]
> My dotfiles are highly personalized, and therefore should realistically only
> be used as a reference as to how to define your own configuration.

1. [Follow the steps to install NixOS normally.](https://nixos.org/download/)
   - It does not matter whether you use the graphical or minimal ISO image, your
     system will be completely rebuilt all the same!
2. Fork and clone this repo somewhere, for example `/etc/nixos/`
3. Replace the `hardware-configuration.nix` in `./hosts/<name of host>/` with
   that which pertains to your own computer's.
   - 💡 Pro tip: The `hardware-configuration.nix` file should be located in
     `/etc/nixos`. If you don't see it, you can run
     `nixos-generate-config --dir <empty dir>` to generate it.
4. Run `nixos-rebuild switch --flake <path to your flake root>#<attribute>`,
   where `<attribute>` is one of the NixOS configurations defined in the flake
   (i.e. 'workstation').
   - If you made your own repo you can also build your system straight off of
     GitHub using
     `nixos-rebuild switch github:<github username>/<reponame>#<attribute>`
5. Enjoy reproducible Linux!

## To-do

- [ ] Refactor definitions to create true nix modules
- [ ] Set up disko/nixos-anywhere for unattended deployment
- [ ] Create a devShell with useful recovery tools
