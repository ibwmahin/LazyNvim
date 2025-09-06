return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- merge with LazyVim defaults instead of overwriting
      opts.window = opts.window or {}
      opts.window.width = 30 -- or function() return math.floor(vim.o.columns * 0.2) end
      return opts
    end,
  },
}
--
-- return {
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     opts = {
--       window = {
--         width = 28, -- default is 40, shrink to 28
--       },
--     },
--   },
-- }
