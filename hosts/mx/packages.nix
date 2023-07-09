{ config, pkgs, ... }@inputs:
{
  environment.systemPackages = with pkgs; [
    busybox
    curl
    unzip
    neofetch
    neovim
    gcc
  ];

}

