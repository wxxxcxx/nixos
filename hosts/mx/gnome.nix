{ config, pkgs, ... }@inputs:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs.gnome; [
    cheese
    gnome-music
    gedit
    epiphany
    geary
    evince
    totem
    tali
    iagno
    hitori
    atomix
  ];
  environment.systemPackages = with pkgs; [
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
    gnomeExtensions.color-picker
    gnomeExtensions.keep-awake
    adw-gtk3
  ];
}

