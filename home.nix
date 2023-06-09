{ config, pkgs, ... }:

{
  home.username = "wx";
  home.homeDirectory = "/home/wx";
  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
    # zsh 配置
    ".zshrc".source = ./dotfiles/zsh/zshrc;
    #".zshenv".source = ./dotfiles/zsh/zshenv;
    #".config/zsh/theme".source = ./dotfiles/zsh/theme;
    #".config/zsh/sudo".source = ./dotfiles/zsh/sudo;
    #".config/zsh/proxy".source = ./dotfiles/zsh/proxy;
    #".config/zsh/antigen".source = ./dotfiles/zsh/antigen;
    #".config/zsh/pyenv".source = ./dotfiles/zsh/pyenv;
    #".config/zsh/fnm".source = ./dotfiles/zsh/fnm;
    #".config/zsh/keys".source = ./dotfiles/zsh/keys;
    #".config/zsh/aliases".source = ./dotfiles/zsh/aliases;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
