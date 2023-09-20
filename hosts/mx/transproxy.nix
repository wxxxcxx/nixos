{ config, pkgs, lib, ... }:
let
  inherit (pkgs) gnugrep iptables busybox;
  inherit (lib) optionalString mkIf;
  serviceConfig = config.services.transproxy;

  chainName = "PROXY";

  opts = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    package = mkOption {
      type = types.package;
      default = pkgs.xray;
    };

    username = mkOption {
      type = types.str;
      default = "proxy";
    };

    port = mkOption {
      type = types.int;
      default = 1090;
    };

    config = mkOption {
      type = types.path;
    };
  };
in
{
  options = {
    services.transproxy = opts;
  };

  config = mkIf (serviceConfig.enable) {

    users.users.${serviceConfig.username} = {
      isSystemUser = true;
      group = "nogroup";
    };

    systemd.services.transproxy =
      let

        preStartScript = pkgs.writeShellScript "transproxy-pre-start" ''
          ${busybox}/bin/ip rule add fwmark 1 table 100
          ${busybox}/bin/ip route add local 0.0.0.0/0 dev lo table 100

          ${iptables}/bin/iptables -t mangle -N ${chainName}

          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 10.0.0.0/24 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 100.64.0.0/10 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 127.0.0.0/8 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 196.254.0.0/16 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 172.16.0.0/12 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 192.0.0.0/24 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 224.0.0.0/4 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName} -d 240.0.0.0/4 -j RETURN
          # ${iptables}/bin/iptables -t mangle -A ${chainName} -d 255.255.255.255 -j RETURN

          ${iptables}/bin/iptables -t mangle -A ${chainName} -p tcp -j TPROXY --on-port 1090 --tproxy-mark 1
          ${iptables}/bin/iptables -t mangle -A ${chainName} -p udp -j TPROXY --on-port 1090 --tproxy-mark 1
          
          ${iptables}/bin/iptables -t mangle -A PREROUTING -j ${chainName}


          ${iptables}/bin/iptables -t mangle -N ${chainName}_LOCAL

          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 10.0.0.0/24 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 100.64.0.0/10 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 127.0.0.0/8 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 196.254.0.0/16 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 172.16.0.0/12 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 192.0.0.0/24 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 224.0.0.0/4 -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 240.0.0.0/4 -j RETURN
          # ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -d 255.255.255.255 -j RETURN
         
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -m owner --uid-owner ${serviceConfig.username} -j RETURN
          ${iptables}/bin/iptables -t mangle -A ${chainName}_LOCAL -j MARK --set-mark 1

          ${iptables}/bin/iptables -t mangle -A OUTPUT -p tcp -j ${chainName}_LOCAL
          ${iptables}/bin/iptables -t mangle -A OUTPUT -p udp -j ${chainName}_LOCAL
        '';

        postStopScript = pkgs.writeShellScript "transproxy-post-stop" ''
          ${busybox}/bin/ip rule del fwmark 1 table 100
          ${busybox}/bin/ip route del local 0.0.0.0/0 dev lo table 100

          ${iptables}/bin/iptables-save -c | ${gnugrep}/bin/grep -v ${chainName} | ${iptables}/bin/iptables-restore -c
        '';
      in
      {
        description = "Transparent proxy service";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        script = "${serviceConfig.package}/bin/xray -config ${serviceConfig.config}";
        unitConfig = {
          ConditionPathExists = serviceConfig.config;
        };
        serviceConfig = {
          User = serviceConfig.username;
          Restart = "on-failure";
          RestartSec = 5;
          ExecStartPre = preStartScript;
          ExecStopPost = postStopScript;
          AmbientCapabilities = [
            "CAP_NET_ADMIN"
            "CAP_NET_BIND_SERVICE"
            "CAP_NET_BROADCAST"
            "CAP_NET_RAW"
          ];
        };
      };
  };
}
