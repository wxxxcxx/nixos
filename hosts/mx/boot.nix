{ config, pkgs, ... }@inputs:
{
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 21;
  boot.loader.systemd-boot.consoleMode = "max";

  boot.loader.systemd-boot.netbootxyz.enable = true;
}

