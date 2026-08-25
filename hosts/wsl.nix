{ config, pkgs, ... }:

{
  imports = [
    ../modules/podman.nix
    ../modules/tools.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "nixos";
  };

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.nixos.extraGroups = [ "podman" ];
  time.timeZone = "Europe/Paris";
  system.stateVersion = "26.05";
}
