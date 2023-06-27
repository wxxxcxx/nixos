{
  description = "Wx's NixOS Flake";

  inputs = {
    # Nixpkgs，即 NixOS 官方软件源
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    programs-sqlite = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles = {
      url = "/home/wx/Workspace/Personal/nixos/dotfiles";
      flake = false;
    };
    nvim = {
      url = "github:wxxxcxx/nvim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, programs-sqlite, home-manager,  ... }@inputs: {
    nixosConfigurations."mx" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        programs-sqlite.nixosModules.programs-sqlite
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wx = import ./home.nix;
	        home-manager.extraSpecialArgs = inputs;
        }
      ];
    };
  };
}
