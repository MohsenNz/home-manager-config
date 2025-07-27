return {
  { -- bufferline
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        max_name_length   = 14,
        max_prefix_length = 9,
        tab_size          = 14,
        show_buffer_icons = false,
        -- separator_style   = "thin" -- "slope"

        hover             = {
          enabled = true,
          reveal = { "close" },
        },
      },
    },
  },

  { -- snacks
    "folke/snacks.nvim",
    opts = {
      explorer = {},
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
      notifier = {},
      indent = {
        indent = {
          char = "│", -- │ ▏
        },
        scope = {
          char = "│",
        },
        animate = {
          enabled = false
        }
      },
      terminal = { enabled = false }
    },
  },

  { -- which-key
    "folke/which-key.nvim",

    opts = {
      spec = {
        { "<leader>l", group = "lsp", icon = { icon = " ", color = "orange" } },
        -- -- Examples
        -- { "<leader>/", "<cmd>normal gcc<cr>", group = "Comment toggle line",      mode = "n" },
        -- { "<leader>/", "<cmd>normal gc<cr>",  group = "Comment toggle selection", mode = "v" },
      },
    },
  },

  { -- flash
    "folke/flash.nvim",
    keys = {
      { "s", false },
    },
  },

  { -- treesitter
    "nvim-treesitter/nvim-treesitter",
    -- opts = {
    --   ensure_installed = {
    --     "haskell",
    --   },
    -- },
    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "haskell",
        "rust",
      })

      return opts
    end,
  },

  { -- blink.cmp
    "saghen/blink.cmp",
    -- https://cmp.saghen.dev/
    opts = {
      -- https://cmp.saghen.dev/configuration/keymap.html
      keymap = {
        ['<Tab>']   = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },
    }
  },

  { -- gitsigns
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        local next_hunk = function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end

        local prev_hunk = function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end

        -- stylua: ignore start
        map("n", "<leader>gj", next_hunk, "Next Hunk")
        map("n", "<leader>gk", prev_hunk, "Prev Hunk")
        -- map("n", "<leader>gJ", function() gs.nav_hunk("last") end, "Last Hunk")
        -- map("n", "<leader>gK", function() gs.nav_hunk("first") end, "First Hunk")
        map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    }
  },
}
