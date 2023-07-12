{ config, pkgs, ... }@inputs:
{
  environment.systemPackages = with pkgs; [
    busybox
    curl
    htop
    unzip
    neofetch
    neovim
    gcc
  ];

}

