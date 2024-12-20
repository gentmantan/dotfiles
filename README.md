# ❄️ My NixOS Dotfiles ❄️
*'It aint much but it's mine!' edition*

## Screenshots
![Screenshot of workstation desktop](screenshot.png)

## Overview
This repository contains my NixOS configuration files. It includes separate flake references for a [#workstation](./hosts/workstation/configuration-workstation.nix) and a [#gaming](./hosts/gaming/configuration-gaming.nix) system. The #workstation system in particular is of interest due to its use of [flatpak sandboxing](./modules/nix-flatpak.nix) to isolate user applications, as well as waybar and hyprland for window managment. The #gaming configuration has both KDE and gamescope enabled as compositors, allowing you to choose either in KDM (the login screen). [With a few lines](https://search.nixos.org/options?channel=unstable&query=displayManager.autoLogin) you can also reconfigure it to auto-login to gamescope, making it truly deck-like.

## Structure 
I go into more detail in an upcoming blog post as to how I came about planning and structuring the system. Stay tuned!

## Installation
1. [Follow the steps to install NixOS normally.](https://nixos.org/download/)
   - It does not matter whether you use the graphical or minimal ISO image, your system will be completely rebuilt all the same!
2. Fork and clone this repo somewhere, for example `/etc/nixos`
3. Review the repo and modify to your heart's content, especially where lines are commented with `FIXME`.
   - 💡 Pro tip: You can search for these by running `grep --color=auto -rni "FIXME" <repo path>`
4. Replace the `hardware-configuration.nix` in `./hosts/<name of host>/` with that of which pertains to your own computer's.
   - 💡 Pro tip: The `hardware-configuration.nix` file should be located in `/etc/nixos`. If you don't see it, you can run `nixos-generate-config --dir <empty dir>` to generate it.
5. Run `nixos-rebuild switch --flake <path to your flake root>#<attribute>`, where `<attribute>` is either 'gaming' or 'workstation'.
   - If you have pushed changes to your repo you can also build your system straight off of github using `nixos-rebuild switch github:<github username>/<reponame>#<attribute>`
6. Enjoy reproducable Linux!
   
## To-do
- [x] Refractor the repo to look more like a proper flake directory
- [ ] Put definitions in separate nix files
- [ ] Make a github action to automate upgrading the flake
