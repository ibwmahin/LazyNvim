return {

  ------------------ SOLARIZED OSAKA
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.g.lazyvim_theme = "solarized-osaka" -- default theme
      vim.cmd.colorscheme(vim.g.lazyvim_theme)
    end,
  },

  --vesper dark theme
  -- {
  --   "datsfilipe/vesper.nvim",
  --   lazy = false, -- Load immediately or on demand
  --   priority = 1000, -- Higher priority for colorscheme loading
  --   config = function()
  --     vim.cmd("colorscheme vesper")
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

  ------------------------------------CATPPUCCIN THEME
  -- 🌸 Catppuccin theme
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     flavour = "mocha", -- latte, frappe, macchiato, mocha
  --     transparent_background = false,
  --     integrations = {
  --       treesitter = true,
  --       native_lsp = { enabled = true },
  --       cmp = true,
  --       gitsigns = true,
  --       nvimtree = true,
  --       telescope = true,
  --       which_key = true,
  --     },
  --   },
  -- },

  -----------------------------------------------tokyonight

  -- {
  --   "folke/tokyonight.nvim",
  --   name = "tokyonight",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night", -- "storm", "night", "moon", "day"
  --     transparent = false,
  --   },
  -- },

  ------------------------ OXOCARBON
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   config = function()
  --     vim.cmd.colorscheme(vim.g.lazyvim_theme or "oxocarbon")
  --   end,
  -- },

  -- Example using lazy.nvim
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa").setup({
  --       -- transparent = false, -- your wallpaper will show through
  --       -- compile = true,
  --       -- undercurl = true,
  --       -- commentStyle = { italic = true },
  --       -- terminalColors = true,
  --       --
  --       -- colors = {
  --       --   theme = {
  --       --     wave = {},
  --       --     lotus = {},
  --       --     dragon = {},
  --       --     all = {},
  --       --   },
  --       -- },
  --     })
  --
  --     -- Pick the variant that fits your wallpaper best
  --     vim.cmd("colorscheme kanagawa-wave") -- 🌊 good for the deep blue tones
  --     -- vim.cmd("colorscheme kanagawa-dragon") -- 🐉 warmer, more contrasty
  --     -- vim.cmd("colorscheme kanagawa-lotus") -- 🌸 brighter, softer
  --   end,
  -- },

  --
  --
  --
}
