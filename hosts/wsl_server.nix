{ config, pkgs, ... }:

{
  imports = [
    ../modules/tools.nix
    ../modules/nodejs.nix
    ../modules/nginx.nix
  ];

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Europe/Paris";
  system.stateVersion = "26.05";

  wsl = {
    enable = true;
    defaultUser = "nixos";
  };

  my.nginx = {
    enable = true;
    domain = "ashford.example.com";
    backendPort = 3000;
  };
}
