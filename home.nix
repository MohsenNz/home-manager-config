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
    xclip # lazyvim dependency
    tmux-mem-cpu-load # dependency for tmux-powerline (will install by tpm)
    joshuto
    jq
    mdbook
    presenterm
    kmonad
    gobang
    fd # Alternative to find, lazyvim dependency
    ripgrep

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
    lua
    lua-language-server
    typescript-language-server
    bun
    yarn
    # nodejs_20
    pnpm_8
    haskell-language-server
    ghc
    cabal-install
    stylish-haskell
    shellcheck # bash-language-server dependency
    bash-language-server
    protobuf
    rye # python project manager
    black # python code formatter
    bun
    yarn
    gemini-cli
    buf

    nerd-fonts.fantasque-sans-mono
    nerd-fonts.space-mono
    nerd-fonts.geist-mono
    nerd-fonts._3270
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono

    (writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
    (writeShellScriptBin "show-dns-ip4" ''
      nmcli dev show | grep 'IP4.DNS'
    '')
    (writeShellScriptBin "show-dns-ip6" ''
      nmcli dev show | grep 'IP6.DNS'
    '')

    # It is sometimes useful to fine-tune packages, for example, by applying
    # overrides. You can do that directly here, just don't forget the
    # parentheses. E g. this is the old way to install nerdfonts
    # (nerdfonts.override {
    #   fonts = [
    #     "FantasqueSansMono"
    #     "SpaceMono"
    #   ];
    # })
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

    ".config/starship.toml".source = dotfiles/starship.toml;
    ".config/tmux-powerline".source = dotfiles/tmux-powerline;
    ".config/alacritty".source = dotfiles/alacritty;
    ".config/wezterm/wezterm.lua".source = dotfiles/wezterm.lua;
    ".config/wezterm/color_scheme.lua".text = theme.wezterm;
    # ".config/fontconfig".source = dotfiles/fontconfig;
    ".config/systemd/user/kmonad.service".source = dotfiles/kmonad.service;

    # nvim
    ".config/nvim/ftplugin".source = dotfiles/nvim/ftplugin;
    ".config/nvim/lua".source = dotfiles/nvim/lua;
    ".config/nvim/init.lua".source = dotfiles/nvim/init.lua;

    # theme handle
    ".config/handle-theme/nvim-theme.lua".text = theme.nvim;
    ".config/handle-theme/alacritty-theme.toml".text = theme.alacritty;
    ".config/handle-theme/tmux-powerline-theme.sh".text = theme.tmux_powerline;

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
    PATH = "$HOME/bin:$HOME/.local/bin:$HOME/.tiup/bin:$PATH";
    EDITOR = "nvim";
    VISUAL = "nvim";

    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";
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

        . "$HOME/.cargo/env"
        eval "$(starship init bash)"
      '';
    };
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
