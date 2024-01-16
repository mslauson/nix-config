
{ config, pkgs, ... }:

{
  home.username = "<username>";
  home.homeDirectory = "/home/mslauson";
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    neofetch
  ];
  programs.home-manager.enable = true;
}
