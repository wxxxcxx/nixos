{ config, nixpkgs-nur, ... }@inputs:
{
  imports = [
    nixpkgs-nur.nixosModules.nur
  ];
  environment.systemPackages = [
    # config.nur.repos.xddxdd.wine-wechat
    # config.nur.repos.xddxdd.wine-wechat
  ];
}

