{ config, pkgs, ... }:

{
  imports = [
    ../modules/tools.nix
    ../modules/nodejs.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "nixos";
  };

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Europe/Paris";
  system.stateVersion = "26.05";

  my.nginx = {
    enable = true;
    domain = "ashford.example.com";
    backendPort = 3000;
  };
  imports = [
    ../modules/nginx.nix
  ];
}
