{ config, pkgs, ... }@inputs:
{
  networking.hostName = "mx";
  networking.networkmanager.enable = true;
}

