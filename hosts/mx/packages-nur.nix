{ config, nixpkgs, ... }@inputs:
let
  npkgs = config.nur;
in
{
  nixpkgs.config.permittedInsecurePackages = [
  ];
  environment.systemPackages = [
  ];
}

