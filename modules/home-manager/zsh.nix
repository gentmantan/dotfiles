{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    history = { 
      ignoreSpace = true;
    };
    historySubstringSearch.enable = true;
  };
}
