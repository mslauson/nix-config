#!/bin/sh

currentPath="$(pwd)"

for file in configuration.nix; do
	rm -rf /etc/nixos/$file
	sudo ln -s "$currentPath"/"$file" /etc/nixos/"$file"
done
