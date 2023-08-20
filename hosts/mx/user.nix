{ config, pkgs, ... }@inputs:
{
  users.mutableUsers = true;

  users.users.wx = {
    isNormalUser = true;
    home = "/home/wx";
    shell = pkgs.zsh;
    description = "Wx";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      vim = "nvim";
    };
  };
}

