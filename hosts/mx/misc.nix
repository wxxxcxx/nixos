{ config, pkgs, ... }@inputs:
{

  sound.enable = true;

  time.timeZone = "Asia/Shanghai";
  console.keyMap = "us";

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      rime
    ];
  };

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";


  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
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

