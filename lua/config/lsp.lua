return {

  -----------------------------------------------------------------------------
  -- LSP CONFIG (keeps your existing LazyVim LSP entry but enriches servers)
  -----------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        tsserver = {},
        eslint = {},
        tailwindcss = {},
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "sass",
            "scss",
            "less",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "astro",
            "vue",
          },
        },
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        marksman = {},
        dockerls = {},
        docker_compose_language_service = {},
        bashls = {},
        pyright = {},
        ruff_lsp = {},
      },
      setup = {
        eslint = function()
          local util = require("lspconfig.util")
          require("lspconfig").eslint.setup({
            root_dir = util.root_pattern(
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.json",
              "package.json"
            ),
            settings = { workingDirectory = { mode = "auto" } },
          })
          return true
        end,
      },
    },
  },

  -----------------------------------------------------------------------------
  -- TypeScript helpers
  -----------------------------------------------------------------------------
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertTextCompletions = true,
        },
      },
    },
  },
}
