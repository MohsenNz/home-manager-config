return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local icons = LazyVim.config.icons
    local opts_ = {
      options = {
        --      
        component_separators = { left = '', right = '' },
        section_separators   = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { -- "mode"
            function() return "Ł" end,
            padding = { left = 2, right = 1 },
            color = {},
            cond = nil,
          }
        },
        -- lualine_b = { "branch", icon = icons.kinds.Control },
        lualine_b = { { "branch", icon = "", color = { gui = "bold" } } },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          { -- diagnostics
            "diagnostics",
            symbols = {
              error = " ",
              warn  = " ",
              info  = "󰌶 ",
              hint  = " ",
            },
          },
          -- { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          Snacks.profiler.status(),
          { -- messages status
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          { -- dap
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          { -- diff
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          { -- shiftwidth
            function()
              local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
              return "󰌒 " .. shiftwidth
            end,
            padding = 1,
          },
          { "filetype", separator = "", padding = { left = 1, right = 1 } }, -- icon_only = true,
        },
        lualine_y = {
          { "location" },
        },
        lualine_z = {
          { "progress", fmt = function() return "%P/%L" end }
        },
      },
    }

    return vim.tbl_deep_extend('force', opts, opts_)
  end

  -- or you can return new options to override all the defaults
  -- opts = function()
  --   return {
  --     --[[add your custom lualine config here]]
  --   }
  -- end,
}
