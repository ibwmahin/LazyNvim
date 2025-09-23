return {

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ 🌌 Solarized Osaka Theme — clean & elegant              │
  -- ╰──────────────────────────────────────────────────────────╯
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false, -- *Load immediately*
    priority = 1000, -- *High priority so it's loaded first*

    opts = {
      transparent = true, -- *Enable transparency*
    },

    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.g.lazyvim_theme = "solarized-osaka"
      vim.cmd.colorscheme(vim.g.lazyvim_theme)
    end,
  },

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ 🌙 Tokyonight — rich plugin support & multiple styles     │
  -- ╰──────────────────────────────────────────────────────────╯
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --
  --   opts = {
  --     style = "night", -- *Choices: "storm", "moon", "night", "day" (we use dark ones)*
  --     transparent = true,
  --     terminal_colors = true,
  --     styles = {
  --       comments = { italic = true },
  --       keywords = { italic = true },
  --       functions = {},
  --       variables = { italic = true },
  --     },
  --     dim_inactive = true,
  --   },
  --
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     vim.g.lazyvim_theme = "tokyonight"
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },
  --

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ 🐉 Kanagawa — serene tones, inspired by Japanese art       │
  -- ╰──────────────────────────────────────────────────────────╯
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --
  --   opts = {
  --     -- Kanagawa has a few styles; pick one dark style
  --     style = "wave", -- *choices: “default”, “wave”, “lotus”, etc.*
  --     transparent = true,
  --     dim_inactive = true,
  --     colors = {
  --       theme = {
  --         all = {
  --           ui = {
  --             bg_gutter = "none",
  --           },
  --         },
  --       },
  --     },
  --     -- optionally: overrides and integrations here
  --   },
  --
  --   config = function(_, opts)
  --     require("kanagawa").setup(opts)
  --     vim.g.lazyvim_theme = "kanagawa"
  --     vim.cmd.colorscheme("kanagawa")
  --   end,
  -- },

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ ⚙️ GitHub Theme — dark variant                          │
  -- ╰──────────────────────────────────────────────────────────╯
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false,
  --   priority = 1000,
  --
  --   opts = {
  --     options = {
  --       transparent = true,
  --     },
  --   },
  --
  --   config = function(_, opts)
  --     require("github-theme").setup(opts)
  --     vim.g.lazyvim_theme = "github_dark_default"
  --     vim.cmd("colorscheme github_dark_default")
  --   end,
  -- },
}
