# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/";
      saved-view = "/";
      window-height = 500;
      window-is-maximized = false;
      window-width = 540;
    };

    "com/github/GradienceTeam/Gradience" = {
      first-run = false;
      last-opened-version = "0.4.1";
      user-flatpak-theming-gtk4 = true;
      window-fullscreen = false;
      window-height = 700;
      window-maximized = false;
      window-width = 1000;
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 1140 780 ];
    };

    "org/gnome/Geary" = {
      migrated-config = true;
    };

    "org/gnome/control-center" = {
      last-panel = "background";
      window-state = mkTuple [ 980 640 ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "/home/wx/.config/background";
      picture-uri-dark = "/home/wx/.config/background";
      primary-color = "#3465a4";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "ibus" "rime" ]) (mkTuple [ "xkb" "us" ]) ];
      per-window = true;
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "ibus" "rime" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Adwaita";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Adwaita";
      text-scaling-factor = 1.2;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-console" "code" "gnome-power-panel" "clash-verge" ];
      show-banners = false;
    };

    "org/gnome/desktop/notifications/application/clash-verge" = {
      application-id = "clash-verge.desktop";
    };

    "org/gnome/desktop/notifications/application/code" = {
      application-id = "code.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/wx/.local/share/backgrounds/Mountain/Mountain-l.png";
      primary-color = "#3465a4";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
      resize-with-right-button = true;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
    };

    "org/gnome/portal/filechooser/org/telegram/desktop" = {
      last-folder-path = "/home/wx/Downloads";
    };

    "org/gnome/shell" = {
      enabled-extensions = [ "hotedge@jonathan.jdoda.ca" "dash-to-dock@micxgx.gmail.com" "customize-ibus@hollowman.ml" "clipboard-indicator@tudmotu.com" "appindicatorsupport@rgcjonas.gmail.com" "just-perfection-desktop@just-perfection" "nightthemeswitcher@romainvigier.fr" "user-theme@gnome-shell-extensions.gcampax.github.com" "transparent-top-bar@zhanghai.me" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "google-chrome.desktop" "org.gnome.Console.desktop" "code.desktop" ];
      welcome-dialog-last-shown-version = "44.2";
    };

    "org/gnome/shell/extensions/customize-ibus" = {
      input-mode-remember = mkUint32 0;
      use-input-indicator = false;
    };

    "org/gnome/shell/extensions/hotedge" = {
      fallback-in-use = false;
      pressure-threshold = mkUint32 50;
      suppress-activation-when-fullscreen = true;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      startup-status = 0;
    };

    "org/gnome/shell/extensions/nightthemeswitcher/cursor-variants" = {
      enabled = true;
      night = "Adwaita";
    };

    "org/gnome/shell/extensions/nightthemeswitcher/gtk-variants" = {
      day = "adw-gtk3";
      enabled = true;
      night = "adw-gtk3-dark";
    };

    "org/gnome/shell/extensions/nightthemeswitcher/icon-variants" = {
      enabled = true;
      night = "Adwaita";
    };

    "org/gnome/shell/extensions/nightthemeswitcher/shell-variants" = {
      enabled = true;
      night = "";
    };

    "org/gnome/shell/extensions/nightthemeswitcher/time" = {
      manual-schedule = true;
      nightthemeswitcher-ondemand-keybinding = [ "<Shift><Super>t" ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.1882352977991104 0.1882352977991104 ]) ];
      selected-color = mkTuple [ true 0.10196078568696976 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 856 534 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 177;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 463 339 ];
      window-size = mkTuple [ 1026 784 ];
    };

  };
}
