{
  description = "Wx's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      # replace official cache with a mirror located in China
      "https://mirrors.bfsu.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];

    # nix community's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # Nixpkgs，即 NixOS 官方软件源
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    programs-sqlite = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles = {
      url = "git+https://github.com/wxxxcxx/dotfiles";
      flake = false;
    };
    nvim = {
      url = "github:wxxxcxx/nvim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, programs-sqlite, home-manager,  ... }@inputs:
  let 
    system = "x86_64-linux";
    specialArgs = inputs // {
      pkgs-stable = import nixpkgs-stable {
        system = system;
        config.allowUnfree = true;
      };
      pkgs-cn = inputs.nixos-cn.legacyPackages.${system};
    };
  in
  {
    nixosConfigurations."mx" = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./hosts/mx
        programs-sqlite.nixosModules.programs-sqlite
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wx = import ./home;
	        home-manager.extraSpecialArgs = specialArgs;
        }
      ];
      specialArgs = specialArgs;
    };
  };
}
