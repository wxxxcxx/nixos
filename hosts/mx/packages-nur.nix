{ config, nixpkgs, nixpkgs-nur, ... }@inputs:
{
  imports = [
    nixpkgs-nur.nixosModules.nur
  ];

  environment.systemPackages = [
  ];
}

