{ config, lib, pkgs, specialArgs, ... }:

let
  bashsettings = import ./bash.nix pkgs;
  vimsettings = import ./vim.nix;
  packages = import ./packages.nix;

  # hacky way of determining which machine I'm running this from
  inherit (specialArgs) withGUI isDesktop networkInterface;

  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isLinux isDarwin;
in
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = packages pkgs withGUI;
  home.homeDirectory = "/home/mslauson";
  home.username = "mslauson";
  home.stateVersion = "21.11";

  # home.file.".config/nvim/coc-settings.json".source = ./coc-settings.json;
  #
  # home.file.".config/polybar/pipewire.sh" = mkIf withGUI {
  #   source = pkgs.callPackage ./nix/polybar.nix { };
  #   executable = true;
  # };

  # services.pulseeffects.enable = false;
  # services.lorri.enable = isLinux;
  # services.pulseeffects.preset = "vocal_clarity";
  services.gpg-agent.enable = isLinux;
  services.gpg-agent.enableExtraSocket = withGUI;
  services.gpg-agent.enableSshSupport = isLinux;

  programs.jq.enable = true;
  programs.fzf.enable = true;



}
