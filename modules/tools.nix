{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl wget htop
    just zed-editor
  ];
}
