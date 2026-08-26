{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl wget htop ssh
    just zed-editor
  ];
}
