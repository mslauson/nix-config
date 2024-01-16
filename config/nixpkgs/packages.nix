pkgs: withGUI: with pkgs; [
  # these files are meant to be installed in all scenarios
  bat
  binutils
  bottom
  cabal-install
  cargo
  cmake

  dbus
  direnv
  eza
  fd
  git
  git-absorb
  gitAndTools.hub
  ghc
  glances
  gnupg                         # gpg command
  gnumake
  hicolor-icon-theme # lutris
  btop

  nix-index
  nix-template
  nix-update
  # nixpkgs-review
  nodejs # needed for coc vim plugins
  openal
  perl # for fzf history
  python3
  ranger
  rnix-lsp
  rustc
  # stack broken

  tree
  wget

  # vim plugin dependencies
  fzf
  ripgrep


  # so neovim can copy to clipboard
  xclip
] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
  mono
  niv
  ntfs3g
  usbutils

  # for work
  vault
  consul

] ++ pkgs.lib.optionals withGUI [
  # intended to be installed with an X11 or wayland session
  brightnessctl
  firefox
  discord
  pavucontrol  # pulseaudio configuration
  jetbrains-toolbox
  lutris
  obs-studio
  #shutter # screenshots
  spotify
  vlc

  tmate
]
