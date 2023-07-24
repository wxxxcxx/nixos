{ config, ... }:

(self: super: {
  discord = super.discord.overrideAttrs (finalAttrs: buildInputs: {
    desktopItem = buildInputs.desktopItem.override {
      exec = "Discord --start-minimized";
    };
  });
})
