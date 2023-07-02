{ config, pkgs, ... }@inputs:
{
  environment.systemPackages = with pkgs; [
    busybox
    curl
    element-desktop
    unzip
    neofetch
    neovim
    git
    jdk
    gh
    gnome.gnome-tweaks
    gnome.gnome-settings-daemon
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.hot-edge
    gnomeExtensions.customize-ibus
    gnomeExtensions.transparent-top-bar
    gnomeExtensions.just-perfection
    gnomeExtensions.night-theme-switcher
    gcc
    bat
    bitwarden
    clash-verge
    google-chrome
    jetbrains.idea-ultimate
    jetbrains.datagrip
    lf
    trash-cli
    lazydocker
    lazygit
    qq
    obsidian
    telegram-desktop
    vscode
    wezterm
    yesplaymusic
    
    nix-index
    rnix-lsp
    nixpkgs-fmt

    (pkgs.callPackage ../../packages/rime-cloverpinyin.nix { })
  ];
}

