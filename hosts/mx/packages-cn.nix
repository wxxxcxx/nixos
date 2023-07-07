{ config, pkgs-cn, nixos-cn, ... }@inputs:
{
  imports = [
    nixos-cn.nixosModules.nixos-cn-registries
    nixos-cn.nixosModules.nixos-cn
  ];
  
  environment.systemPackages = with pkgs-cn; [
  ];
}

