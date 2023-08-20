{ config, pkgs, ... }@inputs:
{
  networking.hostName = "mx";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 8080 8443 ];
  };

}

