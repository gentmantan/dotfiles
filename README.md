### NixOS Dotfiles
*'It aint much but it's mine!' edition*

## Overview
This repository contains my NixOS configuration files. It includes separate flake references for a [#workstation](configuration-workstation.nix) or a [#gaming](configuration-gaming.nix) system. The workstation system in particular is of particular interest due to its use of [flatpak sandboxing](nix-flatpak.nix) to isolate user applications. The gaming system has gamescope enabled as a compositor, allowing you to choose it in KDM for a Steam Deck-like experience. You can also reconfigure it to auto login to gamescope, making it truly deck-like.

# Structure 
I go into more detail in an upcoming blog post as to how I came about planning and structuring the system.

# Installation?
Every Linux system is different, and because of this merely cloning this repo and running `nixos-rebuild switch .#workstation` will not work. Most notably, hardware-configuration.nix includes the UUID of your drive that will be different from mine. 
This configuration should basically only be used as a reference for your own dotfiles. To that end, I annotated places of interest with FIXME comments, which you can find by running `grep --color=auto -rni "FIXME" *` in this project's root. You can also search on https://search.nixos.org to find packages and options you would want to add to your derivation.

Enjoy!
