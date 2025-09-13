return {

  -- this plugin is for the complete emmet
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
    init = function()
      -- Optional: change the trigger key from <C-y>, which conflicts with common bindings
      vim.g.user_emmet_leader_key = "<C-Z>"
    end,
  },
}
