return {
  { -- nvim-lspconfig
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hls = { -- haskell
          filetypes = { "haskell", "lhaskell", "cabal" },
          settings = {
            haskell = {
              cabalFormattingProvider = "cabalfmt",
              formattingProvider = "stylish-haskell", -- fourmolu | ormolu | stylish-haskell, none
            },
          },
        },

        ts_ls = { -- typescript
          filetypes = { "javascript", "typescript", "vue" },
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                languages = { "javascript", "typescript", "vue" },
              },
            },
          },
        },


        nil_ls = { -- nix
          settings = {
            ["nil"] = {
              formatting = {
                command = { "nixpkgs-fmt" },
              },
            },
          },
        },

        rust_analyzer = { -- rust
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
            },
          }
        },

        pyright = { --python
        },

        bashls = { -- bash
        },
      },

      inlay_hints = {
        enabled = false,
      },
    },
  },

  { -- conform.nvim
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettier" },
      },
    },
  },
}
