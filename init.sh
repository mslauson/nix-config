#!/bin/sh

currentPath="$(pwd)"

# for file in configuration.nix; do
# 	rm -rf /etc/nixos/$file
# 	sudo ln -s "$currentPath"/"$file" /etc/nixos/"$file"
# done

rm -rf ~/.config/nix
ln -s $currentPath/.config/nix ~/.config/nix

rm -rf ~/.config/nix
ln -s $currentPath/config/nix ~/.config/nix

# nix --extra-experimental-features nix-command run nixpkgs#home-manager -- switch --flake ~/nix/flakes.nix
nix build $currentPath/nix
