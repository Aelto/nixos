
main:
  just --list

wsl_switch:
  sudo nixos-rebuild switch --flake .#wsl

wsl_server_switch:
  sudo nixos-rebuild switch --flake .#wsl_server
