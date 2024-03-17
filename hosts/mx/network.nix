{ config, pkgs, ... }@inputs:
{
  networking.hostName = "mx";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 8080 8443 ];
  };
  # networking.proxy.default = "http://localhost:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost,mx";

}

