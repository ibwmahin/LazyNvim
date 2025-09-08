return {
  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = false,
  --   },
  --   config = function(_, opts)
  --     require("solarized-osaka").setup(opts)
  --     vim.g.lazyvim_theme = "solarized-osaka" -- default theme
  --     vim.cmd.colorscheme(vim.g.lazyvim_theme)
  --   end,
  -- },
  --
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

  -- tokyonight

  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- "storm", "night", "moon", "day"
      transparent = false,
    },
  },
}
