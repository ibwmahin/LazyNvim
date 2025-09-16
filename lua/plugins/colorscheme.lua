return {

  ------------------ SOLARIZED OSAKA
  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --   },
  --   config = function(_, opts)
  --     require("solarized-osaka").setup(opts)
  --     vim.g.lazyvim_theme = "solarized-osaka" -- default theme
  --     vim.cmd.colorscheme(vim.g.lazyvim_theme)
  --   end,
  -- },
  --------------------- AURA.nvim 💜

  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      -- Set runtime path for the plugin
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      -- Set the colorscheme based on your preference
      vim.cmd([[colorscheme aura-dark]]) -- You can experiment with other variants like aura-dark-soft-text
    end,
  },

  --------------------- lavender.nvim 💜
  -- {
  --   "jthvai/lavender.nvim", -- Theme URL
  --   lazy = false, -- Load the theme immediately
  --   priority = 1000, -- High priority to ensure it's loaded first
  --   opts = {
  --     transparent = true, -- Enable transparent background
  --     italic_comments = true, -- Make comments italic
  --     contrast = "high", -- Set contrast for vibrant colors
  --     style = "night", -- Set the style to "night"
  --   },
  --   config = function()
  --     -- Apply the theme
  --     vim.cmd("colorscheme lavender")
  --   end,
  -- },

  -----------tookyo Dark color scheme 🌌
  -- {
  --   "tiagovla/tokyodark.nvim",
  --   lazy = false,
  --   priority = 1000, -- Load first
  --   opts = {
  --     transparent_background = false,
  --     -- set to false if you don't want transparency
  --     gamma = 1.00, -- contrast adjustment (1.00 is default)
  --     styles = {
  --       comments = { italic = true },
  --       keywords = { italic = true },
  --       identifiers = {},
  --       functions = { bold = true },
  --       variables = { italic = true },
  --     },
  --     terminal_colors = true,
  --   },
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts)
  --     vim.cmd([[colorscheme tokyodark]])
  --   end,
  -- },

  -----------tookyonight color scheme 🌌

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night", -- options: "storm", "moon", "night", "day"
  --     transparent = true, -- << Enable transparency
  --     terminal_colors = true,
  --     styles = {
  --       comments = { italic = true },
  --       keywords = { italic = true },
  --       functions = {},
  --       variables = { italic = true },
  --     },
  --     sidebars = { "qf", "help", "terminal", "lazy", "lspinfo", "packer", "spectre_panel", "toggleterm" },
  --     dim_inactive = true,
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },

  ------------------AYU
  -- {
  --   "Shatur/neovim-ayu",
  --   lazy = false, -- Load immediately
  --   priority = 1000, -- Load before other plugins
  --
  --   config = function()
  --     require("ayu").setup({
  --       mirage = false, -- Set to true for Ayu Mirage variant
  --     })
  --     vim.cmd("colorscheme ayu-dark") -- Options: ayu-dark, ayu-mirage, ayu-light
  --   end,
  -- },

  -------------------------GITHUB THEME
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup({
  --       --  ...
  --     })
  --
  --     -- vim.cmd("colorscheme github_dark")
  --     vim.cmd("colorscheme github_dark_default")
  --     -- vim.cmd("colorscheme github_dark_dimmed")
  --     -- vim.cmd("colorscheme github_dark_high_contrast")
  --     -- vim.cmd("colorscheme github_dark_colorblind")
  --     -- vim.cmd("colorscheme github_dark_tritanopia")
  --   end,
  -- },
}
