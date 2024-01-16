#!/bin/sh

currentPath="$(pwd)"

# for file in configuration.nix; do
# 	rm -rf /etc/nixos/$file
# 	sudo ln -s "$currentPath"/"$file" /etc/nixos/"$file"
# done

rm -rf ~/nix
ln -s $currentPath/nix ~/nix

# nix --extra-experimental-features nix-command run nixpkgs#home-manager -- switch --flake ~/nix/flakes.nix
nix --extra-experimental-features "nix-command flakes" build ~/nix/
