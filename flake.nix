{
  description = "Wx's NixOS Flake";

  nixConfig = {
    # experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    # Nixpkgs，即 NixOS 官方软件源
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nurpkgs.url = github:nix-community/NUR;
    programs-sqlite = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    sops-nix.url = "github:Mic92/sops-nix";
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

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      programs-sqlite = inputs.programs-sqlite;
      home-manager = inputs.home-manager;
      nurpkgs = inputs.nurpkgs;
      sops-nix = inputs.sops-nix;
      agenix = inputs.agenix;
      specialArgs = inputs;
    in
    {
      nixosConfigurations."mx" = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./hosts/mx
          programs-sqlite.nixosModules.programs-sqlite
          home-manager.nixosModules.home-manager
          nurpkgs.nixosModules.nur
          agenix.nixosModules.default
          sops-nix.nixosModules.sops
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
