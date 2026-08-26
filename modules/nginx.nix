{ config, lib, ... }:

let
  cfg = config.my.nginx;
in
{
  options.my.nginx = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        domain = lib.mkOption {
          type = lib.types.str;
        };

        backendPort = lib.mkOption {
          type = lib.types.port;
        };
      };
    });
  };

  config.services.nginx.virtualHosts =
    lib.mapAttrs (name: proxy: {
      serverName = proxy.domain;

      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString proxy.backendPort}";
        proxyWebsockets = true;
      };
    }) config.my.reverseProxies;
}
