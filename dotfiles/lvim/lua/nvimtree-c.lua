local setup              = lvim.builtin.nvimtree.setup

setup.view.side          = "right"
setup.view.width         = 35
setup.view.adaptive_size = true
setup.git.ignore         = true -- don't show ignore files by default (toggle see by S-i)
setup.filters.dotfiles   = true -- don't show hidden files by default (toggle see by S-h)

setup.view.float         = {
    enable = false,
    quit_on_focus_loss = true,
    open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 40,
        -- height = 30,
        row = 0,
        col = 0,
    },
}
