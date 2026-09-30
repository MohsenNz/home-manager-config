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
    tmux-mem-cpu-load # dependency for tmux-powerline (will install by tpm)
    lazygit
    lazydocker
    bat
    starship
    joshuto # terminal file manager
    jq
    mdbook
    presenterm # Terminal based slideshow tool
    kmonad
    gobang
    ripgrep
    dua # disk usage analyzer, usage: `dua i`
    atac # tui alt of postman
    # aider-chat
    # opencode

    neovim
    tree-sitter # neovim dependency
    xclip # neovim dependency
    fd # Alternative to find, Lazyvim dependency
    # mermaid-cli # Lazyvim dependency for diagram (optional)
    # tectonic # Lazyvim dependency for LaTeX (optional)

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
    buf
    protobuf
    go
    k6 # testing tool
    slint-lsp
    slint-viewer
    # Lua
    lua
    lua-language-server
    # TS/JS
    typescript-language-server
    # vue-language-server
    bun
    yarn
    pnpm_8
    # Haskell
    haskell-language-server
    ghc
    cabal-install
    # Bash
    shellcheck # bash-language-server dependency
    bash-language-server
    # Python
    uv # python project manager
    pyright
    # AI tools
    # gemini-cli
    # crush # AI coding agent
    #
    # pgcli # Postgres CLI
    # nodejs_20
    lean4

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
    ".tridactylrc".source = dotfiles/tridactylrc;

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
    PATH = "$HOME/bin:$HOME/.local/bin:$HOME/.tiup/bin:$HOME/.foundry/bin:$PATH";
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

        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

        # export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
        # export JAVA_HOME=$HOME/.local/jdks/jdk-21.0.12.1+1
        export PATH=$JAVA_HOME/bin:$PATH
        export ANDROID_HOME=$HOME/p2/Android/Sdk
        export PATH=$ANDROID_HOME/platform-tools:$PATH
        export PATH=$ANDROID_HOME/emulator:$PATH
        export ANDROID_CLI=$ANDROID_HOME/cmdline-tools/latest/bin

        m_java_export_proxy_socks5() {
          ip=$1
          port=$2
          export JAVA_TOOL_OPTIONS="\
          -DsocksProxyHost=$ip \
          -DsocksProxyPort=$port \
          -Djava.net.preferIPv4Stack=true"
        }

        m_kill_force_9() { kill -9 $1; }
        m_is_port_open() { ss -tulnp | grep $1; }
        m_systemd_reex() { sudo systemctl daemon-reexec; }
        m_systemd_edit() { sudo vim /etc/systemd/system.conf; }

        # work on wayland
        m_orientation_hdmi1()        { gnome-randr modify HDMI-1 --rotate $1; }
        m_orientation_hdmi2()        { gnome-randr modify HDMI-2 --rotate $1; }
        m_orientation_hdmi3()        { gnome-randr modify HDMI-3 --rotate $1; }
        m_orientation_hdmi1_normal() { gnome-randr modify HDMI-1 --rotate normal; }
        m_orientation_hdmi1_right()  { gnome-randr modify HDMI-1 --rotate right; }
      '';
    };
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
