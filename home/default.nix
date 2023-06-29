{ config, pkgs, pkgs-cn, ... }@inputs:
let 
  dotfiles = inputs.dotfiles;
  nvim = inputs.nvim;
in {
  home.username = "wx";
  home.homeDirectory = "/home/wx";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
  ];

  fonts.fontconfig.enable = true; 

  home.file = {
    # zsh
    ".zshrc".source = dotfiles + /zsh/zshrc;
    ".zshenv".source = dotfiles + /zsh/zshenv;
    ".config/zsh".source = config.lib.file.mkOutOfStoreSymlink dotfiles + /zsh/zsh;
    # wezterm
    ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink dotfiles + /wezterm;
    # lf
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink dotfiles + /lf;
    # nvim
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  gtk.cursorTheme = {
    name = "Numix-Cursor-Theme";
    size = 14;
    package = pkgs.numix-cursor-theme;
  };

  programs.home-manager.enable = true;
}
