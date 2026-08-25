{ config, pkgs, ... }:

{
  virtualisation.podman = {
    enable = true;
    # Creates a symlink from docker to podman
    dockerCompat = true;
    # Required for containers under podman-compose to
    # be able to talk to each other.
    defaultNetwork.settings.dns_enabled = true;
  };
}
