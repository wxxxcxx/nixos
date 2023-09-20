{ config, pkgs, ... }@inputs:
{
  boot.swraid.enable = false; # https://github.com/NixOS/nixpkgs/issues/254807
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 21;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.systemd-boot.netbootxyz.enable = true;
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';
}

