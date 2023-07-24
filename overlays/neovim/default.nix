{ config, ... }:

(self: super: {
  neovim = super.neovim.overrideAttrs (finalAttrs: previousAttrs: {
    buildInputs = previousAttrs.buildInputs ++ [ super.gcc ];
  });
})
