{ config, pkgs, ... }@inputs:
{
  environment.systemPackages = with pkgs; [
    busybox
    gnumake
    curl
    htop
    unzip
    neofetch
    neovim
  ];
}

