return {
  { -- nvim-lspconfig
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hls = {                                  -- haskell
          filetypes = { "haskell", "lhaskell" }, -- "cabal"
          settings = {
            haskell = {
              cabalFormattingProvider = "cabalfmt",
              formattingProvider = "stylish-haskell", -- fourmolu | ormolu | stylish-haskell, none
            },
          },
        },

        ts_ls = { -- typescript
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                languages = { 'vue' },
                configNamespace = 'typescript',
              },
            },
          },
        },

        vue_ls = { -- vue
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

        pyright = { -- python
        },

        bashls = { -- bash
          settings = {
            bashIde = {
              shellcheckArguments = "-e SC2034",
            }
          }
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
