{ config, pkgs, ... }:
let
  theme' = "dark"; # dark light
  theme = import ./theme.nix theme';
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mohsen";
  home.homeDirectory = "/home/mohsen";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #   "nvidia"
  # ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # CLI
    xray
    htop
    tmux
    lazygit
    bat
    neofetch
    starship
    neovim
    lunarvim
    xclip # lunarvim dependency
    tmux-mem-cpu-load # dependency for tmux-powerline (will install by tpm)
    joshuto
    jq
    mdbook

    # GUI
    # postman
    # thunderbird
    # mailspring

    # Gnome
    flat-remix-icon-theme
    qogir-theme
    qogir-icon-theme
    volantes-cursors
    whitesur-cursors
    vimix-cursors

    # Development
    devenv
    nil # nix lsp
    nixpkgs-fmt
    taplo # toml toolkit (validator, formatter)
    # nodejs_20
    lua
    lua-language-server
    ghc
    cabal-install
    haskell-language-server
    shellcheck # bash-language-server dependency
    protobuf
    rye # python project manager

    # # example of custom versions
    # (ghc.overrideAttrs {
    #   version = "9.2.8";
    # })
    # haskell.packages.ghc92.ghc

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (nerdfonts.override {
      fonts = [
        "FantasqueSansMono"
        "SpaceMono"
        "GeistMono"
        "Hasklig"
        "3270"
        "FiraMono"
        "IBMPlexMono"
        "JetBrainsMono"
      ];
    })
    #nerd-fonts.fantasque-sans-mono
    #nerd-fonts.space-mono
    #nerd-fonts.geist-mono
    #nerd-fonts._3270
    #nerd-fonts.fira-mono
    # nerd-fonts.jetbrains-mono

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
    (writeShellScriptBin "edit-home" ''
      lvim "$HOME_MANAGER_DIR"/home.nix
    '')
    (writeShellScriptBin "show-dns-ip4" ''
      nmcli dev show | grep 'IP4.DNS'
    '')
    (writeShellScriptBin "show-dns-ip6" ''
      nmcli dev show | grep 'IP6.DNS'
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # NOTE: .json files (e.g: xray.json) cause nautilus crash, put theme in far paths 
    ".tmux.conf".source = dotfiles/tmux.conf;
    ".tpm".source = dotfiles/tpm;
    ".gitconfig".source = dotfiles/gitconfig;
    ".config/lvim".source = dotfiles/lvim;
    ".config/starship.toml".source = dotfiles/starship.toml;
    ".config/tmux-powerline".source = dotfiles/tmux-powerline;
    ".config/alacritty".source = dotfiles/alacritty;
    ".config/wezterm/wezterm.lua".source = dotfiles/wezterm.lua;
    ".config/handle-theme/lvim-theme.lua".text = theme.lvim;
    ".config/handle-theme/alacritty-theme.toml".text = theme.alacritty;
    ".config/handle-theme/tmux-powerline-theme.sh".text = theme.tmux_powerline;
    ".config/wezterm/color_scheme.lua".text = theme.wezterm;
    # ".config/fontconfig".source = dotfiles/fontconfig;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mohsen/etc/profile.d/hm-session-vars.sh
  #
  # it works if this be enabled
  # programs.bash.enable = true;
  home.sessionVariables = {
    PATH = "$HOME/bin:$HOME/.local/bin:$PATH";
    EDITOR = "lvim";
    HOME_MANAGER_DIR = "$HOME/.config/home-manager";
    DOTFILES_DIR = "$HOME_MANAGER_DIR/dotfiles";
    VISUAL = "lvim";

    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";

    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/";
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;
  programs = {
    home-manager.enable = true;
    # allow nix to handle bash and env vars
    bash = {
      enable = true;
      initExtra = ''
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
        alias ls='ls --color=auto'
        alias ll='ls -alF'
        alias la='ls -A'
        alias l='ls -CF'
        eval "$(starship init bash)"
      '';
    };
    # direnv = {
    #   enable = true;
    #   enableBashIntegration = true; # see note on other shells below
    #   nix-direnv.enable = true;
    # };
  };
}
