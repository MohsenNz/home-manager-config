return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = require("nvim-theme").colorscheme, --"tokyonight",
      icons = {
        diagnostics = {
          Error = " ", -- 
          Warn  = " ", -- 
          Hint  = "󰌶 ", -- 
          Info  = " ", -- 
        },
        extra = {
          LineLeft = "▏",
          LineMiddle = "│",
          DividerLeft = "",
          DividerRight = "",
          BoldDividerLeft = "",
          BoldDividerRight = "",
          EmptyFolder = "",
          EmptyFolderOpen = "",
          File = "",
          FileSymlink = "",
          Files = "",
          FindFile = "󰈞",
          FindText = "󰊄",
          Fire = "",
          Folder = "󰉋",
          FolderOpen = "",
          FolderSymlink = "",
          Tab = "󰌒",
          Target = "󰀘",
        }
      },
    },
  },

  { -- tokyonight
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "storm" },
  },
  { "rose-pine/neovim",          lazy = true, name = "rose-pine" },
  { "joshdick/onedark.vim",      lazy = true },
  { "sainnhe/everforest",        lazy = true },
  { "lifepillar/vim-solarized8", lazy = true },

  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
}
