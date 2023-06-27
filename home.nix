{ config, pkgs, dotfiles, ... }@inputs:
let 
  dotfiles = inputs.dotfiles;
  nvim = inputs.nvim;
in {
  home.username = "wx";
  home.homeDirectory = "/home/wx";

  home.stateVersion = "23.05";

  home.file = {
    ".zshrc".source = dotfiles + /zsh/zshrc;
    ".zshenv".source = dotfiles + /zsh/zshenv;
    ".config/zsh".source = dotfiles + /zsh;
    ".config/zsh".recursive = true;
    # nvim
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
