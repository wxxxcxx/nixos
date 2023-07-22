{ config, pkgs, ... }@inputs:
{
  system.stateVersion = "23.05";
  nix = {
    package = pkgs.nixUnstable;
    settings.auto-optimise-store = true;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    auto-optimise-store = true;
  };
  nixpkgs.overlays = import ../../overlays inputs;

  imports = [
    ./boot.nix
    ./network.nix
    ./misc.nix
    ./user.nix
    ./gnome.nix
    ./font.nix
    ./packages.nix
    ./packages-nur.nix
    ./transproxy.nix
    ./hardware-configuration.nix
  ];
}

