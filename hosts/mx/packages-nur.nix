{ config, nixpkgs-nur, ... }@inputs:
{
  imports = [
    nixpkgs-nur.nixosModules.nur
  ];
  environment.systemPackages = [
    # config.nur.repos.xddxdd.wechat-uos
    # config.nur.repos.xddxdd.wine-wechat
  ];
}

