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
  -- {
  --   "baliestri/aura-theme",
  --   lazy = false,
  --   priority = 1000,
  --   config = function(plugin)
  --     -- Set runtime path for the plugin
  --     vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
  --     -- Set the colorscheme based on your preference
  --     vim.cmd([[colorscheme aura-dark]]) -- You can experiment with other variants like aura-dark-soft-text
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

  ------------------- OXOCAEBON;
  {
    "nyoom-engineering/oxocarbon.nvim", -- Plugin URL
    lazy = false, -- Load immediately (no lazy loading)
    priority = 1000, -- Ensure high priority to load the theme first
    config = function()
      -- Apply the Oxocarbon theme
      vim.cmd("colorscheme oxocarbon")

      -- Optional: Set transparent background for various UI elements
      vim.cmd("hi Normal guibg=NONE") -- Transparent background for Normal mode
      vim.cmd("hi SignColumn guibg=NONE") -- Transparent background for SignColumn (gutter)
      vim.cmd("hi VertSplit guibg=NONE") -- Transparent background for VertSplit
      vim.cmd("hi StatusLine guibg=NONE") -- Transparent background for StatusLine
      vim.cmd("hi TabLine guibg=NONE") -- Transparent background for TabLine
      vim.cmd("hi TabLineFill guibg=NONE") -- Transparent background for TabLineFill
      vim.cmd("hi FloatBorder guibg=NONE") -- Transparent background for floating windows
    end,
  },

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
