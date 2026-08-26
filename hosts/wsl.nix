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

  # System-wide Nix settings for this host
  nix.settings.auto-optimise-store = true;

  # Pair it with automatic weekly garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
