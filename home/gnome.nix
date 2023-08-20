{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/Console" = {
      last-window-size = mkTuple [ 1200 800 ];
      theme = "auto";
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
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
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
      button-layout = "close,minimize:appmenu";
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
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [ "order-extensions@wa4557.github.com" ];
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "clipboard-indicator@tudmotu.com" "color-picker@tuberry" "customize-ibus@hollowman.ml" "dash-to-dock@micxgx.gmail.com" "hotedge@jonathan.jdoda.ca" "just-perfection-desktop@just-perfection" "KeepAwake@jepfa.de" "nightthemeswitcher@romainvigier.fr" "transparent-top-bar@zhanghai.me" "user-theme@gnome-shell-extensions.gcampax.github.com" "speed@eexpss.gmail.com" "blur-my-shell@aunetx" "places-menu@gnome-shell-extensions.gcampax.github.com" "rounded-window-corners@yilozt" "show-desktop-button@amivaleo" "scroll-workspaces@gfxmonk.net" "trayIconsReloaded@selfmade.pl" "simplenetspeed@biji.extension" "InternetSpeedMeter@alshakib.dev" "extension-list@tu.berry" "caffeine@patapon.info" ];
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
    };

    "org/gnome/shell/extensions/customize-ibus" = {
      enable-orientation = true;
      candidate-orientation = mkUint32 1;
      lookup-table-orientation = 0;
      input-indicator-only-on-toggle = true;
    };

    "org/gnome/shell/extensions/hotedge" = {
      fallback-in-use = false;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
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

    "org/gnome/shell/extensions/rounded-window-corners" = {
      border-color = mkTuple [ 0.23999999463558197 0.23999999463558197 ];
      border-width = 0;
      custom-rounded-corner-settings = "@a{sv} {}";
      focused-shadow = "{'vertical_offset': 4, 'horizontal_offset': 0, 'blur_offset': 28, 'spread_radius': 4, 'opacity': 60}";
      global-rounded-corner-settings = "{'padding': <{'left': <uint32 0>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <false>, 'fullscreen': <false>}>, 'border_radius': <uint32 12>, 'smoothing': <uint32 0>, 'enabled': <true>}";
      settings-version = mkUint32 5;
      unfocused-shadow = "{'horizontal_offset': 0, 'vertical_offset': 2, 'blur_offset': 12, 'spread_radius': -1, 'opacity': 65}";
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
