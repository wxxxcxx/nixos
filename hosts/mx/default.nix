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

  imports = [ 
    ./packages.nix
    ./packages-nur.nix
    ./packages-cn.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mx";
  networking.networkmanager.enable = true;

  sound.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.supportedLocales = ["en_US.UTF-8/UTF-8"];
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
    ];
  };

  console.keyMap = "us";
  
  users.mutableUsers = true;
  users.users.wx = {
    isNormalUser = true;
    home = "/home/wx";
    shell = pkgs.zsh;
    description = "Wx";
    extraGroups = ["wheel" "networkmanager"];
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
      videoDrivers = ["nvidia"];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  fonts = {
    enableDefaultFonts = true;

    fonts = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      source-code-pro
      maple-mono
      nerdfonts
    ];

    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoi"];
        monospace = [
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
        ];
        serif = [
          "Noto Sans CJK SC"
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

