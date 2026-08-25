
main:
  just --list

wsl_switch:
  sudo nixos-rebuild switch --flake .#wsl
