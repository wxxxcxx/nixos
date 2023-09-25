{ config, nixpkgs, ... }@inputs:
let
  npkgs = config.nur;
in
{
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  environment.systemPackages = [
    npkgs.repos.xddxdd.wechat-uos-bin
  ];
}

