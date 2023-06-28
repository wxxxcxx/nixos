{ config, pkgs, nixos-cn, ... }@inputs:
let
  pkgs-cn = nixos-cn.legacyPackages.${pkgs.system};
in{
  environment.systemPackages = with pkgs; [
    curl
    unzip
    neofetch
    neovim
    git
    jdk
    hyprland
    gh
    gnome.gnome-tweaks
    gnome.gnome-settings-daemon 
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.customize-ibus
    gnomeExtensions.transparent-top-bar 
    gnomeExtensions.just-perfection
    gnomeExtensions.night-theme-switcher
    gcc
    pkgs-cn.netease-cloud-music
  ];
}

