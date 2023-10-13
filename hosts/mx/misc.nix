{ config, pkgs, agenix, ... }@inputs:
{

  sound.enable = true;

  time.timeZone = "Asia/Shanghai";
  console.keyMap = "us";

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      rime
    ];
  };

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";


  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "wx" ];


  environment.variables = {
    EDITOR = "nvim";
  };

  environment.systemPackages = [
    pkgs.age
    agenix.packages.x86_64-linux.default
  ];

  age.secrets.proxyConfig = {
    file = ../../secrets/proxy.json.age;
    path = "/etc/proxy/proxy.json";
    mode = "666";
  };

  services.transproxy = {
    enable = false;
    config = config.age.secrets.proxyConfig.path;
  };

  hardware.pulseaudio.enable = true;
}

