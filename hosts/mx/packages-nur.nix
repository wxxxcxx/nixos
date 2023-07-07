{ config, nixpkgs, nixpkgs-nur, ... }@inputs:
{
  imports = [
    nixpkgs-nur.nixosModules.nur
  ];


  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1u"
  ];

  environment.systemPackages = [
    config.nur.repos.xddxdd.wechat-uos-bin
  ];
}

