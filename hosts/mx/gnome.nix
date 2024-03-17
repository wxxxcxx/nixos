{ config, pkgs, ... }@inputs:
{


  # services.xserver.videoDrivers = [ "nvidia" ];

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   #Fix graphical corruption on suspend/resume
  #   powerManagement.enable = true;
  #   # open = true;
  # };
  hardware.opengl = {
    enable = true;
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs.gnome; [
    cheese
    gnome-music
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
    adw-gtk3
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
    gnomeExtensions.caffeine
    gnomeExtensions.show-desktop-button
    gnomeExtensions.blur-my-shell
    gnomeExtensions.top-panel-workspace-scroll
    gnomeExtensions.internet-speed-meter
  ];
}

