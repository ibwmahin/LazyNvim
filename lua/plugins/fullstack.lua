-- lua/plugins/fullstack.lua
-- Fullstack plugin list: Web (TS/JS/React/Tailwind), Python, LSP, DAP, Testing, Themes, QoL

local util = require("lspconfig.util")
return {

  -----------------------------------------------------------------------------
  -- TREESITTER (language parsing)
  -----------------------------------------------------------------------------
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

  -----------------------------------------------------------------------------
  -- MASON (ensure Python tooling + JS tooling + formatters)
  -----------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
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

  -----------------------------------------------------------------------------
  -- COMPLETION / SNIPPETS
  -----------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "roobert/tailwindcss-colorizer-cmp.nvim", "hrsh7th/cmp-nvim-lsp" },
    opts = function(_, opts)
      local ok, tw = pcall(require, "tailwindcss-colorizer-cmp")
      if ok then
        opts.formatting = opts.formatting or {}
        opts.formatting.format = tw.formatter
      end
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    opts = {},
  },

  -----------------------------------------------------------------------------
  -- COLOR / TAILWIND PREVIEWS
  -----------------------------------------------------------------------------
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      user_default_options = { names = false, tailwind = true, mode = "background" },
    },
  },

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
  -- LINTERS (nvim-lint)
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
            local root =
              util.root_pattern(".eslintrc", ".eslintrc.json", "eslint.config.js", "package.json")(ctx.filename)
            return root ~= nil
          end,
        },
        stylelint = {
          condition = function(ctx)
            local root = util.root_pattern(".stylelintrc", "stylelint.config.js")(ctx.filename)
            return root ~= nil
          end,
        },
      },
    },
  },

  -----------------------------------------------------------------------------
  -- DEBUGGING: DAP + Python integration
  -----------------------------------------------------------------------------
  { "jay-babu/mason-nvim-dap.nvim", opts = { ensure_installed = { "js", "python" }, handlers = {} } },
  { "mfussenegger/nvim-dap", dependencies = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text" } },
  { "rcarriga/nvim-dap-ui", opts = {} },
  { "theHamsta/nvim-dap-virtual-text", opts = {} },

  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    config = function()
      local ok, dap_python = pcall(require, "dap-python")
      if not ok then
        return
      end
      local has_mason, mr = pcall(require, "mason-registry")
      if has_mason and mr.is_installed("debugpy") then
        local pkg = mr.get_package("debugpy")
        local python_path = pkg:get_install_path() .. "/venv/bin/python"
        if vim.fn.executable(python_path) == 0 then
          python_path = nil
        end
        if python_path then
          dap_python.setup(python_path)
        else
          dap_python.setup()
        end
      else
        dap_python.setup()
      end
    end,
  },

  -----------------------------------------------------------------------------
  -- TESTING: neotest with python & jest adapters
  -----------------------------------------------------------------------------

  { "nvim-neotest/nvim-nio", lazy = true },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio", -- <-- IMPORTANT: provides 'nio' module
    },
    opts = function()
      return {
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
        },
      }
    end,
  },

  -----------------------------------------------------------------------------
  -- GIT
  -----------------------------------------------------------------------------
  { "lewis6991/gitsigns.nvim", opts = {} },
  { "NeogitOrg/neogit", cmd = "Neogit", opts = {} },
  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewClose" } },

  -----------------------------------------------------------------------------
  -- QUALITY OF LIFE
  -----------------------------------------------------------------------------
  { "folke/todo-comments.nvim", event = "VeryLazy", opts = {} },
  { "ThePrimeagen/harpoon", branch = "harpoon2", opts = {} },

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
