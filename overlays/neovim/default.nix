{ config, ... }:

(self: super: {
  neovim = super.neovim.overrideAttrs (finalAttrs: originAttrs: {
    buildInputs = originAttrs.buildInputs ++ [ super.gcc ];
  });
})
