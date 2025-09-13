return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- merge with LazyVim defaults instead of overwriting
      opts.window = opts.window or {}
      opts.window.width = 30 -- or function() return math.floor(vim.o.columns * 0.2) end

      -- Add this to show hidden files and dotfiles
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}

      opts.filesystem.filtered_items.visible = true -- Show filtered (hidden) items
      opts.filesystem.filtered_items.hide_dotfiles = false -- Show dotfiles like .gitignore
      opts.filesystem.filtered_items.hide_gitignored = false -- Show .gitignored files too

      return opts
    end,
  },
}
