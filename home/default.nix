{ config, pkgs, ... }@inputs:
let
  dotfiles = inputs.dotfiles;
  nvim = inputs.nvim;
in
{
  home.username = "wx";
  home.homeDirectory = "/home/wx";

  home.stateVersion = "23.05";

  imports = [
    ./gnome.nix
  ];

  home.packages = with pkgs; [
    cryptomator
    element-desktop
    gh
    bat
    bitwarden
    clash-verge
    google-chrome
    chromium
    jetbrains.idea-ultimate
    jetbrains.datagrip
    lf
    trash-cli
    lazydocker
    lazygit
    qq
    obsidian
    telegram-desktop
    vscode
    wezterm
    yesplaymusic
    discord
    betterdiscordctl
    postman
    dconf2nix
    nix-index
    rnix-lsp
    nixpkgs-fmt
    mpv
    ulauncher
  ];

  fonts.fontconfig.enable = true;

  home.file = {
    # zsh
    ".zshrc".source = dotfiles + /zsh/zshrc;
    ".zshenv".source = dotfiles + /zsh/zshenv;
    ".config/zsh/".source = dotfiles + /zsh/zsh;
    ".config/zsh/".recursive = true;
    # ssh 
    ".ssh/".source = dotfiles + /ssh;
    ".ssh/".recursive = true;
    # wezterm
    ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink dotfiles + /wezterm;
    # lf
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink dotfiles + /lf;
    # nvim
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvim;
    # rime
    ".config/ibus/rime/default.custom.yaml".text = ''
      patch:
        "menu/page_size": 8
        schema_list:
          - schema: clover
    '';
    # mpv
    ".config/mpv".source = dotfiles + /mpv;
    ".config/mpv".recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  systemd.user.sessionVariables = {
    EDITOR = "nvim";
  };

  gtk.cursorTheme = {
    name = "Numix-Cursor-Theme";
    size = 14;
    package = pkgs.numix-cursor-theme;
  };

  programs.git = {
    enable = true;
    userName  = "Wx";
    userEmail = "wxxxcxx@gmail.com";
  };

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };
  programs.home-manager.enable = true;
}
