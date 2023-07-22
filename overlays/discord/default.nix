{ config, ... }:

(self: super: {
  discord = super.discord.overrideAttrs (finalAttrs: originAttrs: {
    desktopItem = originAttrs.desktopItem.override {
      exec = "Discord --start-minimized";
    };
  });
})
