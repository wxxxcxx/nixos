{ config, pkgs, ... }:

{
  home.username = "wx";
  home.homeDirectory = "/home/wx";
  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
    # zsh 配置
    ".zshrc".source = ../zsh/zshrc;
    ".zshenv".source = ../zsh/zshenv;
    ".config/zsh/theme".source = ../zsh/theme;
    ".config/zsh/sudo".source = ../zsh/sudo;
    ".config/zsh/proxy".source = ../zsh/proxy;
    ".config/zsh/antigen".source = ../zsh/antigen;
    ".config/zsh/pyenv".source = ../zsh/pyenv;
    ".config/zsh/fnm".source = ../zsh/fnm;
    ".config/zsh/keys".source = ../zsh/keys;
    ".config/zsh/aliases".source = ../zsh/aliases;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
