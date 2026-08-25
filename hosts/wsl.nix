{ config, pkgs, ... }:

{
  wsl = {
    enable = true;
    defaultUser = "nixos";
  };

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git vim curl jq htop
  ];

  virtualisation.podman = {
    enable = true;
    # Creates a symlink from docker to podman
    dockerCompat = true;
    # Required for containers under podman-compose to
    # be able to talk to each other.
    defaultNetwork.settings.dns_enabled = true;
  };
  users.users.nixos.extraGroups = [ "podman" ];

  time.timeZone = "Europe/Paris";

  system.stateVersion = "26.05";
}
