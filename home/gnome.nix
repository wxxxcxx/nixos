{ lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/Console" = {
      last-window-size = mkTuple [ 1200 800 ];
      theme = "auto";
    };
    "org/gnome/desktop/a11y" = {
      always-show-universal-access-status = false;
    };
    "org/gnome/control-center" = {
      last-panel = "background";
      window-state = mkTuple [ 980 640 ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "ibus" "rime" ]) ];
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "ibus" "rime" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
      per-window = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
      activate-window-menu = [ ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Adwaita";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      icon-theme = "Adwaita";
      text-scaling-factor = 1.25;
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
      resize-with-right-button = true;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      center-new-windows = true;
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      maximized = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = true;
      sleep-inactive-ac-timeout = 1800;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "clipboard-indicator@tudmotu.com" "color-picker@tuberry" "customize-ibus@hollowman.ml" "dash-to-dock@micxgx.gmail.com" "hotedge@jonathan.jdoda.ca" "just-perfection-desktop@just-perfection" "KeepAwake@jepfa.de" "nightthemeswitcher@romainvigier.fr" "transparent-top-bar@zhanghai.me" "user-theme@gnome-shell-extensions.gcampax.github.com" "speed@eexpss.gmail.com" "blur-my-shell@aunetx" "show-desktop-button@amivaleo" "scroll-workspaces@gfxmonk.net" "trayIconsReloaded@selfmade.pl" "simplenetspeed@biji.extension" "InternetSpeedMeter@alshakib.dev" "extension-list@tu.berry" "caffeine@patapon.info" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" ];
    };

    "org/gnome/shell/extensions/caffeine" = {
      countdown-timer = 0;
      enable-fullscreen = false;
      indicator-position-max = 3;
      show-indicator = "always";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      hot-keys = false;
      running-indicator-style = "DOTS";
      pressure-threshold = 10.0;
      autohide-in-fullscreen = true;
    };

    "org/gnome/shell/extensions/customize-ibus" = {
      enable-orientation = true;
      candidate-orientation = mkUint32 1;
      lookup-table-orientation = 0;
      input-indicator-only-on-toggle = true;
    };

    "org/gnome/shell/extensions/hotedge" = {
      fallback-in-use = false;
      pressure-threshold = mkUint32 50;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      startup-status = 0;
    };

    "org/gnome/shell/extensions/nightthemeswitcher/commands" = {
      enabled = true;
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

    "org/gnome/shell/extensions/simplenetspeed" = {
      mode = 2;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/settings/file-chooser" = {
      sidebar-width = 200;
      window-size = mkTuple [ 800 600 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      sidebar-width = 200;
      window-size = mkTuple [ 800 600 ];
    };
  };
}
