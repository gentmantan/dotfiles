# ❄️ My NixOS Dotfiles ❄️

_'Without me, my neovim config is useless. Without my neovim config, I am
useless. 📝' edition_

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
  as well as [hyprland](https://github.com/hyprwm/Hyprland) for window
  management and [nvf](https://github.com/NotAShelf/nvf) for text editing.
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

## Structure

I go into more detail in an upcoming blog post as to how I came about planning
and structuring these systems. Stay tuned!

## Installation

1. [Follow the steps to install NixOS normally.](https://nixos.org/download/)
   - It does not matter whether you use the graphical or minimal ISO image, your
     system will be completely rebuilt all the same!
2. Fork and clone this repo somewhere, for example `/etc/nixos`
3. Review the repo and modify to your heart's content, especially where lines
   are commented with `FIXME`.
   - 💡 Pro tip: You can search for these by running
     `grep --color=auto -rni "FIXME" <repo path>`
4. Replace the `hardware-configuration.nix` in `./hosts/<name of host>/` with
   that of which pertains to your own computer's.
   - 💡 Pro tip: The `hardware-configuration.nix` file should be located in
     `/etc/nixos`. If you don't see it, you can run
     `nixos-generate-config --dir <empty dir>` to generate it.
5. Run `nixos-rebuild switch --flake <path to your flake root>#<attribute>`,
   where `<attribute>` is either 'workstation', 'server' or 'gaming'.
   - If you have pushed changes to your own repo you can also build your system
     straight off of GitHub using
     `nixos-rebuild switch github:<github username>/<reponame>#<attribute>`
6. Enjoy reproducible Linux!

## To-do

- [ ] Set up disko/nixos-anywhere for unattended deployment
- [ ] Create a devShell with useful recovery tools
- [ ] Automate livecd build and upload as Github artifacts
