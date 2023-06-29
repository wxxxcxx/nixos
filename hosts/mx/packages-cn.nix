{ config, pkgs-cn, nixos-cn, ... }@inputs:
{
  imports = [
    # 将nixos-cn flake提供的registry添加到全局registry列表中
    # 可在`nixos-rebuild switch`之后通过`nix registry list`查看
    nixos-cn.nixosModules.nixos-cn-registries

    # 引入nixos-cn flake提供的NixOS模块
    nixos-cn.nixosModules.nixos-cn
  ];
  environment.systemPackages = with pkgs-cn; [
    # netease-cloud-music
  ];
}

