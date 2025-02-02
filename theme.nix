theme:
let
  # https://github.com/alacritty/alacritty-theme?tab=readme-ov-file#color-schemes
  alacritty' =
    if theme == "dark"
    then "tokyo-night-storm"
    else "rose-pine-dawn";
  # everforest onedark tokyonight rose-pine
  lvim_colorscheme =
    if theme == "dark"
    then "tokyonight"
    else "everforest";
  tmux_powerline' =
    if theme == "dark"
    then "dark-cp"
    else "github-light-cp";
  wezterm' =
    if theme == "dark"
    then "Tokyo Night Storm"
    else "rose-pine-dawn";


  alacritty = ''
    import = ["~/.config/alacritty/themes/themes/${alacritty'}.toml"] 
  '';
  lvim = ''
    vim.opt.background = "${theme}"
    lvim.colorscheme   = "${lvim_colorscheme}"
  '';
  tmux_powerline =
    ''source "$HOME/.config/tmux-powerline/themes/${tmux_powerline'}.sh"'';
  wezterm = ''
    return '${wezterm'}'
  '';
in
{
  inherit tmux_powerline lvim alacritty wezterm;
}
