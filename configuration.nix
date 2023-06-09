{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''experimental-features = nix-command flakes'';
  };
  nixpkgs.config = {
    allowUnfree = true;
    auto-optimise-store = true;
  };

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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
      rime
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
      localConf = ''
        <match target="font">
          <edit mode="assign" name="rgba">
            <const>rgb</const>
          </edit>
        </match>

        <match target="font">
          <edit mode="assign" name="hintstyle">
            <const>hintfull</const>
          </edit>
        </match>

        <match target="font">
          <edit mode="assign" name="antialias">
            <bool>true</bool>
          </edit>
        </match>

        <match target="font">
          <edit name="lcdfilter" mode="assign">
            <const>lcddefault</const>
          </edit>
        </match>
        <alias>
          <family>serif</family>
          <prefer>
            <family>Noto Serif</family>
            <family>Noto Serif CJK SC</family>
            <family>Noto Serif CJK TC</family>
            <family>Noto Serif CJK JP</family>
          </prefer>
        </alias>
        <alias>
          <family>sans-serif</family>
          <prefer>
            <family>Noto Sans</family>
            <family>Noto Sans CJK SC</family>
            <family>Noto Sans CJK TC</family>
            <family>Noto Sans CJK JP</family>
          </prefer>
        </alias>
        <!--以上为设置无衬线字体优先度-->
        <alias>
          <family>monospace</family>
          <prefer>
            <family>Source Code Pro</family>
            <family>Noto Sans Mono CJK SC</family>
            <family>Noto Sans Mono CJK TC</family>
            <family>Noto Sans Mono CJK JP</family>
          </prefer>
        </alias>
        <!--以上为设置等宽字体优先度-->
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    clash-verge
    neofetch
    neovim
    git
    jdk
    hyprland
    gh
    google-chrome
    gnome.gnome-tweaks
    gnome.gnome-settings-daemon 
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.customize-ibus
    gnomeExtensions.transparent-top-bar 
    gnomeExtensions.just-perfection
    gnomeExtensions.user-themes-x
    qq
    rustup
    telegram-desktop
    vscode.fhs
    wezterm

  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      vim = "nvim";
      update = "sudo nixos-rebuild switch --flake ~/Workspace/Personal/nixos";
    };
  };

}

