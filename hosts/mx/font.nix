{ config, pkgs, ... }@inputs: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      source-sans
      source-serif
      source-han-sans
      source-han-serif

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra

      source-code-pro
      maple-mono
      nerdfonts
    ];

    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        style = "full";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
      antialias = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoi" ];
        monospace = [
          "Source Code Pro"
          "Noto Sans Mono"
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          "Source Sans"
          "Source Han Sans SC"
          "Noto Sans"
          "Noto Sans CJK SC"
        ];
        serif = [
          "Source Serif"
          "Source Han Serif SC"
          "Noto Serif"
          "Noto Serif CJK SC"
        ];
      };
    };
  };
}
