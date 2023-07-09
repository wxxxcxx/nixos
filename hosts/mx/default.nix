{ config, pkgs, ... }@inputs:
{
  system.stateVersion = "23.05";
  nix = {
    package = pkgs.nixUnstable;
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings.auto-optimise-store = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    auto-optimise-store = true;
  };
  nixpkgs.overlays = import ../../overlays inputs;


  imports = [
    ./packages.nix
    ./packages-nur.nix
    ./packages-cn.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 21;
  boot.loader.systemd-boot.consoleMode = "max";

  boot.loader.systemd-boot.netbootxyz.enable = true;

  networking.hostName = "mx";
  networking.networkmanager.enable = true;

  sound.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      rime
    ];
  };

  console.keyMap = "us";

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  users.mutableUsers = true;
  users.users.wx = {
    isNormalUser = true;
    home = "/home/wx";
    shell = pkgs.zsh;
    description = "Wx";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };


  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
      };
    };
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  fonts = {
    enableDefaultFonts = true;

    fonts = with pkgs; [
      source-sans
      source-serif
      source-han-sans
      source-han-serif

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra

      source-code-pro
      maple-mono
      nerdfonts
    ];

    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        style = "full";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
      antialias = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoi" ];
        monospace = [
          "Source Code Pro"
          "Noto Sans Mono"
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          "Source Sans"
          "Source Han Sans SC"
          "Noto Sans"
          "Noto Sans CJK SC"
        ];
        serif = [
          "Source Serif"
          "Source Han Serif SC"
          "Noto Serif"
          "Noto Serif CJK SC"
        ];
      };
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      vim = "nvim";
      update = "sudo nixos-rebuild switch";
    };
  };
}

