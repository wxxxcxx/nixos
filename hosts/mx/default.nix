{ config, pkgs, pkgs-cn, nixos-cn, ... }@inputs:
{
  nix = {
    package = pkgs.nixUnstable;
    settings.substituters = [ "https://nixos-cn.cachix.org" ];
    settings.trusted-public-keys = [ "nixos-cn.cachix.org-1:L0jEaL6w7kwQOPlLoCR3ADx+E3Q8SEFEcB9Jaibl0Xg=" ];
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    auto-optimise-store = true;
  };

  imports = [ 
    ./packages.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Nixos-CN
    nixos-cn.nixosModules.nixos-cn-registries
    nixos-cn.nixosModules.nixos-cn
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mx";
  networking.networkmanager.enable = true;

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

  system.stateVersion = "22.11"; # Did you read the comment?

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

