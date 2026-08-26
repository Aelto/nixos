{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl wget htop env
    just zed-editor
  ];
}
