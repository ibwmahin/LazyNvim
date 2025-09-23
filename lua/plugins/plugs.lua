return {

  -----------------------------------------------------------------------------
  -- MASON (ensure Python tooling + JS tooling + formatters)
  -----------------------------------------------------------------------------
  {
    "wmason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "yaml-language-server",
        "emmet-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "pyright",
        "ruff",
        "debugpy",
        "black",
        "ruff-lsp",
        "prettier",
        "prettierd",
        "eslint_d",
        "stylelint",
        "shfmt",
        "stylua",
        "js-debug-adapter",
      },
    },
  },

  -- Mason: Auto-install more tools (JS debugger, etc.)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettier",
        "eslint_d",
        "stylelint-lsp",
        "js-debug-adapter", -- For JS/TS debugging
      })
    end,
  },

  -- Treesitter: Add more parsers if needed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "toml",
        "bash",
        "dockerfile",
        "python",
        "markdown",
        "markdown_inline",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Enhanced Tailwind: Color highlights, swatches in completion, class sorting
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      document_color = {
        enabled = true, -- Inline color swatches
        kind = "inline", -- Or "foreground" / "background"
      },
      conceal = {
        enabled = false, -- Optionally hide class names for cleaner view
      },
    },
  },
  -- color highlights for hex
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "background",
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_hsl_without_function = true,
      enable_ansi = true,
      enable_var_usage = true,
      enable_tailwind = true,
    },
  },

  -- Emmet: Enhanced for tag completion (like VS Code) in HTML/JSX/TSX
  {
    "mattn/emmet-vim",
    event = "InsertEnter",
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.g.user_emmet_leader_key = "<C-y>" -- Trigger: Ctrl+Y then ,
      vim.cmd([[
        autocmd FileType html,css,jsx,javascriptreact,typescriptreact,vue EmmetInstall
      ]])
    end,
  },

  -- Integrate Emmet with CMP for auto-suggestions (popup like VS Code)
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emmet" }, -- CMP source for Emmet
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emmet" })
    end,
  },

  -- JS/TS Debugging Adapter (for dap.core extra)
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data")
          .. "/mason/packages/js-debug-adapter",
        adapters = { "pwa-node", "pwa-chrome" }, -- Node/Chrome debugging
      })
      require("dap").configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
      require("dap").configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "ts-node",
        },
      }
    end,
  },

  -----------------------------------------------------------------------------
  -- Optional / user-listed plugins (lazy loads where appropriate)
  -----------------------------------------------------------------------------
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  { "L3MON4D3/LuaSnip", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "lewis6991/gitsigns.nvim", lazy = true },
}
