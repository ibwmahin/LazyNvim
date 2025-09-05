return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = function()
          return math.floor(vim.o.columns * 0.3) -- 30% of current screen width
        end,
      },
    },
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
