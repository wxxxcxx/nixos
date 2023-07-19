{
  description = "Wx's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    # Nixpkgs，即 NixOS 官方软件源
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-nur = {
      url = github:nix-community/NUR;
    };
    programs-sqlite = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    dotfiles = {
      # url = "path:/home/wx/Workspace/Personal/dotfiles";
      url = "git+https://github.com/wxxxcxx/dotfiles";
      flake = false;
    };
    nvim = {
      url = "github:wxxxcxx/nvim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nixpkgs-nur, programs-sqlite, home-manager, agenix, ... }@inputs:
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
          agenix.nixosModules.default
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
