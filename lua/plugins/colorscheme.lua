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

  -----------tookyonight color scheme 🌌

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- options: "storm", "moon", "night", "day"
      transparent = false, -- << Enable transparency
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
      sidebars = { "qf", "help", "terminal", "lazy", "lspinfo", "packer", "spectre_panel", "toggleterm" },
      dim_inactive = false,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  ----------monokai pro

  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("monokai-pro").setup({
  --       filter = "machine",
  --       -- options: classic | octagon | pro | machine | ristretto | spectrum
  --     })
  --     vim.cmd.colorscheme("monokai-pro")
  --   end,
  -- },
  --

  --
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
