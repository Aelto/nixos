{ config, lib, ... }:

let
  cfg = config.my.nginx;
in
{
  options.my.nginx = {
    enable = lib.mkEnableOption "nginx reverse proxying";

    domain = lib.mkOption {
      type = lib.types.str;
    };

    backendPort = lib.mkOption {
      type = lib.types.port;
    };
  };

  config = lib.mkIf cfg.enable {
    services.nginx = {
      enable = true;

      virtualHosts.${cfg.domain} = {
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString cfg.backendPort}";
          proxyWebsockets = true;
        };
      };
    };
  };
}
