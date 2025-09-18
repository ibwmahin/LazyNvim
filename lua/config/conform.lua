return {

  -----------------------------------------------------------------------------
  -- FORMATTER: Conform (on save)
  -----------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        python = { "ruff_format", "black" },
        sh = { "shfmt" },
      },
    },
  },

  -----------------------------------------------------------------------------
  -- TESTING: neotest with python & jest adapters
  -----------------------------------------------------------------------------
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        css = { "stylelint" },
        scss = { "stylelint" },
        python = { "ruff" },
      },
      linters = {
        eslint_d = {
          condition = function(ctx)
            ---@diagnostic disable-next-line: undefined-field
            local root = require("lazyvim.util").root_pattern(
              ".eslintrc",
              ".eslintrc.json",
              ".eslintrc.js",
              "eslint.config.js",
              "package.json"
            )(ctx.filename)
            return root ~= nil
          end,
        },
        stylelint = {
          condition = function(ctx)
            local root = require("lazyvim.util").root_pattern(
              ".stylelintrc",
              ".stylelintrc.json",
              ".stylelintrc.js",
              "stylelint.config.js",
              "package.json"
            )(ctx.filename)
            return root ~= nil
          end,
        },
      },
    },
  },
}
