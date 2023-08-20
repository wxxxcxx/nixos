{ config, ... }:

(self: super: {
  neovim = super.buildEnv {
    name = "neovim";
    paths = with super; [
      neovim
      gcc
      gnutar
    ];
  };
})
